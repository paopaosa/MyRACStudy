//
//  ViewController.swift
//  MyRACStudy
//
//  Created by macpps on 16/2/4.
//  Copyright © 2016年 PPS. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var username: NSTextField!
    @IBOutlet weak var password: NSSecureTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.username.rac_textSignal().subscribeNext { text in
            self.view.window?.title = "当前登录用户:" + (text as! String)
            log.debug("you have input:\(text)")
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


}

