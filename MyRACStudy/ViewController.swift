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

class LoginViewModel {
    let infoAction = RACCommand { (object) -> RACSignal! in
        return RACSignal.createSignal({ (observer) -> RACDisposable! in
            log.debug("click info button")
            observer.sendNext("ok")
            observer.sendCompleted()
            return RACDisposable(block:{ print("click info button over.")})
        })
        }.toAction()
    
    private var startAction: Action<String, Void, NoError> = {
        return Action { _ in
            log.debug("info clicked")
            return SignalProducer<Void, NoError>.empty
        }
    }()
    
    var forgetCocoaAtion:Action<String, Void, NoError> = {
        return Action { _ in
            log.debug("forget clicked")
            return SignalProducer<Void, NoError>.empty
        }
    }()
    
    private var infoCocoaAction:CocoaAction?
    
    init () {
        self.infoCocoaAction = CocoaAction(startAction, input:"asdf")
    }
    
    func bindToInfoButton(btn: NSButton!) {
        btn.target = self.infoCocoaAction
        btn.action = CocoaAction.selector
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

        self.viewModel.bindToInfoButton(self.infoBtn)
        
        self.forgetBtn.rac_command = RACCommand(signalBlock: { (any) -> RACSignal! in
            print("click forget")
            return RACSignal.empty()
        })
        
//        self.username.rac_textSignal().subscribeNext { text in
//            self.view.window?.title = "当前登录用户:" + (text as! String)
//            log.debug("you have input:\(text)")
//            userViewModel.tempUsername = text as? String
//        }
        
//        var nameSignal:RACSignal
//        userViewModel.tempUsername <~ nameSignal
        self.rac_signalForSelector(#selector(NSViewController.viewWillAppear)).subscribeNext {[weak self](object) -> Void in
            self!.view.window?.title = "登录"
        }
    
        let titleSignal:Signal = DynamicProperty(object: self.view, keyPath: "window.title").signal
        titleSignal.observeNext{ text in
            log.debug("your window title to \(text!)")
        }
        titleSignal.observeFailed { error in
            log.debug("Failed: \(error)")
        }
        titleSignal.observeCompleted {
            log.debug("Completed")
        }
        titleSignal.observeInterrupted {
            log.debug("Interrupted")
        }
        
        DynamicProperty(object: self, keyPath: "title").signal
            .observeNext{ object in
                log.debug("what is nsviewcontroller title:\(object)")
            }
        
        self.title = "1"
        self.title = "2"

        let (waitSignal,observer) = Signal<Int, NoError>.pipe()
        waitSignal.observeNext { (next) -> () in
            log.debug("wait signal send next: \(next)")
        }
        
        observer.sendNext(1)
        observer.sendNext(0)
        
        
        let nameSignalProducer = self.username.rac_textSignal().toSignalProducer()
        nameSignalProducer.start { event in
            switch event {
            case let .Next(value):
                if let text = value {
                    log.debug("Next event: \(text)")
                }
            case let .Failed(error):
                log.debug("Failed event: \(error)")
                
            case .Completed:
                log.verbose("Completed event")
                
            case .Interrupted:
                log.verbose("Interrupted event")
            }
        }
        
        NSNotificationCenter.defaultCenter().rac_addObserverForName("MyNotification", object: nil).subscribeNext { notification in
            log.debug("we got my notification:\(notification.debugDescription!)")
        }
        
        let signalA = self.rac_signalForSelector(#selector(NSViewController.viewWillAppear))
        signalA.subscribeNext { [unowned self]AnyObjectA in
            log.info("your view will Appear:\(self.view.window!.title)")
            self.createSignal()
        }
        
        self.createSignal().observeNext { (next) -> () in
            log.debug(closure: { () -> String? in
                return "hello\(next)"
            })
        }
    }
    
    func createSignal() -> Signal<String, NoError> {
        var count = 0
        return Signal {
            observer in
//            NSTimer.schedule(repeatInterval: 1.0) { timer in
//                sink.sendNext("tick #\(count++)")
//            }
            timer(1, onScheduler: QueueScheduler.mainQueueScheduler)
                .startWithNext{ next in
                    count += 1
                    observer.sendNext("tick #\(count)")
            }
            return nil
        }
    }
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    deinit {
        log.debug("view controller dealloc.")
    }

}

