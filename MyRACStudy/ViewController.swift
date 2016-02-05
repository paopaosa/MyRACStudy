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

class ViewController: NSViewController {
    @IBOutlet weak var username: NSTextField!
    @IBOutlet weak var password: NSSecureTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        self.username.rac_textSignal().subscribeNext { text in
//            self.view.window?.title = "当前登录用户:" + (text as! String)
//            log.debug("you have input:\(text)")
//            userViewModel.tempUsername = text as? String
//        }
        
//        var nameSignal:RACSignal
//        userViewModel.tempUsername <~ nameSignal
        self.rac_signalForSelector("viewWillAppear").subscribeNext {[weak self](object) -> Void in
            self!.view.window?.title = "登录"
        }
    
        let titleSignal:Signal = DynamicProperty(object: self.view, keyPath: "window.title").signal
        titleSignal.observeNext{ text in
            log.debug("your window title to \(text!)")
        }

        DynamicProperty(object: self, keyPath: "title").signal
            .observeNext{ object in
                log.debug("what is nsviewcontroller title:\(object)")
            }
        
        self.title = "1"
        self.title = "2"
//        let newSignal:ReactiveCocoa.Signal
        
        
        let nameSignalProducer = self.username.rac_textSignal().toSignalProducer()
        nameSignalProducer.start { event in
            switch event {
            case let .Next(value):
                if let text = value {
                    log.debug("Next event: \(text)")
                }
            case let .Failed(error):
                print("Failed event: \(error)")
                
            case .Completed:
                print("Completed event")
                
            case .Interrupted:
                print("Interrupted event")
            }
        }
        
        
        
        NSNotificationCenter.defaultCenter().rac_addObserverForName("MyNotification", object: nil).subscribeNext { notification in
            log.debug("we got my notification:\(notification.debugDescription!)")
        }
        
        let signalA = self.rac_signalForSelector("viewWillAppear")
        signalA.subscribeNext { AnyObjectA in
            log.info("your view will Appear:\(self.view.window!.title)")
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

