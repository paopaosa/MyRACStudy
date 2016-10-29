//
//  ViewController.swift
//  MyRACStudy
//
//  Created by macpps on 16/2/4.
//  Copyright © 2016年 PPS. All rights reserved.
//

import Cocoa
import Result
import ReactiveCocoa
import ReactiveSwift
import ReactiveObjCBridge
import ReactiveObjC

class LoginViewModel {
//    let infoAction = RACCommand { (object) -> RACSignal in
//        return RACSignal.createSignal({ (observer) -> RACDisposable? in
//            debugPrint("click info button")
//            observer.sendNext("ok")
//            observer.sendCompleted()
//            return RACDisposable(block:{ print("click info button over.")})
//        })
//    }
    
    private var startAction: Action<String, Void, NoError> = {
        return Action { i in
            debugPrint("info clicked:\(i)")
            return SignalProducer<Void, NoError>.empty
        }
    }()
    
    var forgetCocoaAtion:Action<String, Void, NoError> = {
        return Action { _ in
            debugPrint("forget clicked")
            return SignalProducer<Void, NoError>.empty
        }
    }()
    
    private var infoCocoaAction:CocoaAction<Any>?

    init () {
        self.infoCocoaAction = CocoaAction(startAction, input:"asdf")
    }
    
    func bindToInfoButton(_ btn: NSButton!) {
        btn.target = self.infoCocoaAction
        btn.action = CocoaAction<Any>.selector
    }
}


class ViewController: NSViewController {
    @IBOutlet weak var username: NSTextField!
    @IBOutlet weak var password: NSSecureTextField!
    @IBOutlet weak var infoBtn: NSButton!
    @IBOutlet weak var forgetBtn: NSButton!
    
    let viewModel = LoginViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let label = NSButton()
//        let property = MutableProperty<String>("")
//        
//        DynamicProperty(object: label, keyPath: "text") <~ property.producer.map { $0 }
//        let t = self.username.rac_textSignal().toSignalProducer().map { $0 }
//        if let window = self.view.window? {
//            let windowTitlePropo = DynamicProperty(object: window, keyPath: "title")
//        }

        self.viewModel.bindToInfoButton(self.infoBtn)
        
//        self.forgetBtn.rac_command = RACCommand(signal: { (any) -> RACSignal! in
//            debugPrint("click forget")
//            return RACSignal.empty()
//        })
        self.forgetBtn.rac_command = RACCommand(signal: { (any) -> RACSignal in
            debugPrint("click forget")
            return RACSignal.empty()
        })
        
        
//        self.username.rac_textSignal().subscribeNext { text in
//            self.view.window?.title = "当前登录用户:" + (text as! String)
//            debugPrint("[username]:\(text!)")
////            userViewModel.tempUsername = text as? String
//        }
        
        let searchStrings = self.username.rac_textSignal()
            .toSignalProducer()
            .map { text in text as! String }
            .observe(on: UIScheduler())

        searchStrings.startWithResult { [unowned self] result in
            if let value = result.value {
                debugPrint("[name]:\(value)")
                self.view.window?.title = value.utf8.count > 0 ? "登录名:" + value : "登录"
                self.title = value
            }
        }
        
//        self.username.rac_textSignal().subscribeNext({ text in
//            debugPrint("you have input:\(text)")
//        })
        
//        let inputSignal = self.username.rac_textSignal()
//        var nameSignal:RACSignal
//        userViewModel.tempUsername <~ nameSignal
//        self.rac_signalForSelector(#selector(NSViewController.viewWillAppear)).subscribeNext {[weak self](object) -> Void in
//            self!.view.window?.title = "登录"
//        }
        self.rac_signal(for: #selector(NSViewController.viewWillAppear))
        .subscribeNext { [weak self](object) in
            self!.view.window?.title = "登录"
        }

        let titleSignal:Signal<AnyObject?,NoError> = DynamicProperty(object: self.view, keyPath: "window.title").signal
        titleSignal.observeValues{ text in
            debugPrint("your window title is:\(text!)")
        }
        titleSignal.observeFailed { error in
            debugPrint("Failed: \(error)")
        }
        titleSignal.observeCompleted {
            debugPrint("Completed")
        }
        titleSignal.observeInterrupted {
            debugPrint("Interrupted")
        }

//        DynamicProperty(object: self, keyPath: "title").signal
//            .observeNext{ object in
//                NSLog("what is nsviewcontroller title:\(object)")
//            }

        (DynamicProperty(object: self, keyPath: "title").signal as Signal<AnyObject?, NoError>).observeValues { value in
            if let _title = value as? String {
                debugPrint("what is ns viewcontorller title:\(_title)")
            }
        }
        self.title = "1"
        self.title = "2"

        // create signal and observer
        let (waitSignal,observer) = Signal<String, NoError>.pipe()
        waitSignal.observeValues { (next) in
            debugPrint("wait signal send next: \(next)")
        }
        observer.send(value: "one")
        observer.send(value: "zero")

        // create signal

        
        
//        let nameSignalProducer = self.username.rac_textSignal().toSignalProducer()
//        nameSignalProducer.start { event in
//            switch event {
//            case let .Next(value):
////                if let text = value {
////                    NSLog("Next event: \(text)")
////                }
//                NSLog("Next event: \(value)")
//            case let .Failed(error):
//                NSLog("Failed event: \(error)")
//                
//            case .Completed:
//                log.verbose("Completed event")
//                
//            case .Interrupted:
//                log.verbose("Interrupted event")
//            }
//        }
//        
//        NSNotificationCenter.defaultCenter().rac_addObserverForName("MyNotification", object: nil).subscribeNext { notification in
//            NSLog("we got my notification:\(notification.debugDescription!)")
//        }
//        
//        let signalA = self.rac_signalForSelector(#selector(NSViewController.viewWillAppear))
//        signalA.subscribeNext { [unowned self]AnyObjectA in
//            log.info("your view will Appear:\(self.view.window!.title)")
//            self.createSignal()
//        }
        
//        self.createSignal().observeNext { (next) -> () in
//            NSLog(closure: { () -> String? in
//                return "hello \(next)"
//            })
//        }
    }
    
    func createSignal() -> Signal<String, NoError> {
        var count = 0
        return Signal {
            observer in
//            NSTimer.schedule(repeatInterval: 1.0) { timer in
//                sink.sendNext("tick #\(count++)")
//            }
           // swift 2.3
//            timer(1, onScheduler: QueueScheduler.mainQueueScheduler)
//                .startWithNext{ next in
//                    count += 1
//                    observer.sendNext("tick #\(count)")
//            }
            // swift 3.0
            timer(interval: 1.0, on: QueueScheduler.main)
                .startWithCompleted {
                    count += 1
                    observer.send(value: "tick #\(count)")
            }
            return nil
        }
    }
    
//    override var representedObject: AnyObject? {
//        didSet {
//        // Update the view, if already loaded.
//        }
//    }
    
    deinit {
        NSLog("view controller dealloc.")
    }

}

