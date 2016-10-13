//
//  ViewController.swift
//  MyRACStudy
//
//  Created by macpps on 16/2/4.
//  Copyright © 2016年 PPS. All rights reserved.
//

import Cocoa
import Result
import ReactiveSwift
import ReactiveCocoa
//import ReactiveObjCBridge
//import ReactiveObjC

class LoginViewModel {
//    let infoAction = RACCommand { (object) -> RACSignal! in
//        return RACSignal.createSignal({ (observer) -> RACDisposable! in
//            NSLog("click info button")
//            observer.sendNext("ok")
//            observer.sendCompleted()
//            return RACDisposable(block:{ print("click info button over.")})
//        })
//        }.bridgedAction(from:);
    
    private var startAction: Action<String, Void, NoError> = {
        return Action { _ in
            NSLog("info clicked")
            return SignalProducer<Void, NoError>.empty
        }
    }()
    
    var forgetCocoaAtion:Action<String, Void, NoError> = {
        return Action { _ in
            NSLog("forget clicked")
            return SignalProducer<Void, NoError>.empty
        }
    }()
    
//    private var infoCocoaAction:CocoaAction?
//    
//    init () {
//        self.infoCocoaAction = CocoaAction(startAction, input:"asdf")
//    }
//    
//    func bindToInfoButton(_ btn: NSButton!) {
//        btn.target = self.infoCocoaAction
//        btn.action = CocoaAction.selector
//    }
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

//        self.viewModel.bindToInfoButton(self.infoBtn)
        
        self.forgetBtn.rac_command = RACCommand(signal: { (any) -> RACSignal! in
            debugPrint("click forget")
            return RACSignal.empty()
        })
        
//        self.username.rac_textSignal().subscribeNext { text in
//            self.view.window?.title = "当前登录用户:" + (text as! String)
//            NSLog("you have input:\(text)")
//            userViewModel.tempUsername = text as? String
//        }
        
//        var nameSignal:RACSignal
//        userViewModel.tempUsername <~ nameSignal
//        self.rac_signalForSelector(#selector(NSViewController.viewWillAppear)).subscribeNext {[weak self](object) -> Void in
//            self!.view.window?.title = "登录"
//        }
        self.rac_signal(for: #selector(NSViewController.viewWillAppear))
        .subscribeNext { [weak self](object) in
            self!.view.window?.title = "登录"
        }
    
//        let titleSignal:Signal = DynamicProperty(object: self.view, keyPath: "window.title").signal
//        titleSignal.observeNext{ text in
//            debugPrint("your window title to \(text!)")
//        }
//        titleSignal.observeFailed { error in
//            debugPrint("Failed: \(error)")
//        }
//        titleSignal.observeCompleted {
//            debugPrint("Completed")
//        }
//        titleSignal.observeInterrupted {
//            debugPrint("Interrupted")
//        }

//        DynamicProperty(object: self, keyPath: "title").signal
//            .observeNext{ object in
//                NSLog("what is nsviewcontroller title:\(object)")
//            }
        
        self.title = "1"
        self.title = "2"

//        let (waitSignal,observer) = Signal<Int, NoError>.pipe()
//        waitSignal.observeNext { (next) -> () in
//            NSLog("wait signal send next: \(next)")
//        }
        let (waitSignal, observer) = Signal<Int, NoError>.pipe()
        waitSignal.observe(Observer<Int, NoError>{ NSLog("asdfasdf")})
        
//        observer.sendNext(1)
//        observer.sendNext(0)
        observer.send(value: 1)
        observer.send(value: 0)
        
        
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

