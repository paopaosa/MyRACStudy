//
//  AppDelegate.swift
//  MyRACStudy
//
//  Created by macpps on 16/2/4.
//  Copyright © 2016年 PPS. All rights reserved.
//

import Cocoa
//import XCGLogger
import Result
import ReactiveSwift
import ReactiveCocoa



////let log: XCGLogger = XCGLogger.defaultInstance()
////let systemLogDestination = XCGNSLogDestination(owner: log, identifier: "advancedLogger.systemLogDestination")
//
//
//let log: XCGLogger = {
//    let log = XCGLogger.defaultInstance()
//    #if DEBUG
//        log.setup(.Debug, showThreadName: true, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil)
//    #else
//        log.setup(.Severe, showThreadName: true, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil)
//        if let consoleLog = log.logDestination(XCGLogger.Constants.baseConsoleLogDestinationIdentifier) as? XCGConsoleLogDestination {
//            consoleLog.logQueue = XCGLogger.logQueue
//        }
//    #endif
//    
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "MM/dd/yyyy hh:mma"
//    dateFormatter.locale = NSLocale.currentLocale()
//    log.dateFormatter = dateFormatter
//    log.xcodeColorsEnabled = true // Or set the XcodeColors environment variable in your scheme to YES
//    log.xcodeColors = [
//        .Verbose: .lightGrey,
//        .Debug: XCGLogger.XcodeColor(fg: NSColor(netHex:0x4d8de7), bg: NSColor(netHex:0xf8f8f8)),
//        .Info: .darkGreen,
//        .Warning: .orange,
//        .Error: XCGLogger.XcodeColor(fg: NSColor.redColor(), bg: NSColor.whiteColor()), // Optionally use a UIColor
//        .Severe: XCGLogger.XcodeColor(fg: (255, 255, 255), bg: (255, 0, 0)) // Optionally use RGB values directly
//    ]
//    return log
//}()
//
//let userViewModel:MRUserViewModel = {
//    let userViewModel = MRUserViewModel()
//    return userViewModel
//}()

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
//        #if DEBUG
//            log.setup(.Debug, showThreadName: true, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil)
//        #else
//            log.setup(.Severe, showThreadName: true, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil)
//            if let consoleLog = log.logDestination(XCGLogger.Constants.baseConsoleLogDestinationIdentifier) as? XCGConsoleLogDestination {
//                consoleLog.logQueue = XCGLogger.logQueue
//            }
//        #endif
//        // Optionally set some configuration options
//        systemLogDestination.outputLogLevel = .Debug
//        systemLogDestination.showLogIdentifier = false
//        systemLogDestination.showFunctionName = true
//        systemLogDestination.showThreadName = true
//        systemLogDestination.showLogLevel = true
//        systemLogDestination.showFileName = true
//        systemLogDestination.showLineNumber = true
//        systemLogDestination.showDate = true
//        
//        // Add the destination to the logger
//        log.addLogDestination(systemLogDestination)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

