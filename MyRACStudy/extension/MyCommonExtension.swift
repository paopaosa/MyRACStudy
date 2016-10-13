//
//  MyCommonExtension.swift
//  MyRACStudy
//
//  Created by macpps on 16/2/5.
//  Copyright © 2016年 PPS. All rights reserved.
//

import Cocoa

extension NSColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    class func randColor() -> NSColor! {
        var colors:Array<NSColor> =
        [
            NSColor(red: 0.910, green: 0.600, blue: 0.710, alpha: 1.00),
            NSColor(red: 0.580, green: 0.682, blue: 0.910, alpha: 1.00),
            NSColor(red: 0.714, green: 0.647, blue: 0.851, alpha: 1.00),
            NSColor(red: 0.506, green: 0.757, blue: 0.678, alpha: 1.00),
            NSColor(red: 0.439, green: 0.761, blue: 0.894, alpha: 1.00),
            NSColor(red: 0.957, green: 0.631, blue: 0.635, alpha: 1.00),
            NSColor(red: 0.980, green: 0.788, blue: 0.475, alpha: 1.00)
        ]
        let diceFaceCount: UInt32 = UInt32(colors.count)
        let randomRoll = Int(arc4random_uniform(diceFaceCount))
        if randomRoll < colors.count {
            return colors[randomRoll]
        }
        else {
            return colors.first
        }
    }
    
    class func randBreakColor() -> NSColor! {
        var colors:Array<NSColor> =
        [
            NSColor(red: 0.910, green: 0.600, blue: 0.710, alpha: 1.00),
            NSColor(red: 0.580, green: 0.682, blue: 0.910, alpha: 1.00),
            NSColor(red: 0.714, green: 0.647, blue: 0.851, alpha: 1.00),
            NSColor(red: 0.506, green: 0.757, blue: 0.678, alpha: 1.00),
            NSColor(red: 0.439, green: 0.761, blue: 0.894, alpha: 1.00),
            NSColor(red: 0.957, green: 0.631, blue: 0.635, alpha: 1.00),
            NSColor(red: 0.980, green: 0.788, blue: 0.475, alpha: 1.00)
        ]
        let diceFaceCount: UInt32 = UInt32(colors.count)
        let randomRoll = Int(arc4random_uniform(diceFaceCount))
        if randomRoll < colors.count {
            return colors[randomRoll]
        }
        else {
            return colors.first
        }
    }
    
    class func ppNavigationColor() -> NSColor {
        return NSColor(netHex: 0x333)
    }
    
    class func ppLightGray() -> NSColor {
        return NSColor(netHex: 0xf8f8f8)
    }
    
    class func ppLightBlue() -> NSColor! {
        return NSColor(red: 0.000, green: 0.475, blue: 0.859, alpha: 1.00)
    }
    
    class func ppDarkBlue() -> NSColor! {
        return NSColor(red: 0.012, green: 0.165, blue: 0.298, alpha: 1.00)
    }
    
    class func ppManColor() -> NSColor! {
        return NSColor(red: 0.435, green: 0.753, blue: 0.839, alpha: 1.00)
    }
    
    class func ppWomanColor() -> NSColor! {
        return NSColor(red: 0.886, green: 0.514, blue: 0.631, alpha: 1.00)
    }
    
    class func ppLightDot() -> NSColor! {
        return NSColor(red: 0.867, green: 0.925, blue: 0.929, alpha: 1.00)
    }
    
    class func ppDarkDot() -> NSColor! {
        return NSColor(red: 0.412, green: 0.686, blue: 0.729, alpha: 1.00)
    }
    
    class func blueBtn() -> NSColor! {
        return NSColor(red: 0.553, green: 0.800, blue: 0.925, alpha: 1.00)
    }
    
    class func ppGreen() -> NSColor! {
        return NSColor(red: 0.294, green: 0.635, blue: 0.714, alpha: 1.00)
    }
    
    class func gnppBtn() -> NSColor! {
        return NSColor(netHex: 0x1C7DDE).withAlphaComponent(0.7)
    }
    
    class func textBrown() -> NSColor! {
        return NSColor(netHex: 0x9C6A67)
    }
    
    class func textPink() -> NSColor! {
        return NSColor(netHex: 0xFBA5A3)
    }
    
    class func ppLightYellow() -> NSColor {
        return NSColor(netHex: 0xF2EEEB)
    }
    
    class func ppChoseFromGray() -> NSColor {
        return NSColor(netHex: 0xE2E2E2)
    }
    
    class func ppBtnBlue() -> NSColor {
        return NSColor(netHex: 0x3C96E4)
    }
    
    class func ppBtnLightBlue() -> NSColor {
        return NSColor(netHex: 0xE9F9FF)
    }
    
    class func ppBtnBlueTitle() -> NSColor {
        return NSColor(netHex: 0x6CB8DA)
    }
    
    class func ppNavigationLightGray() -> NSColor {
        return NSColor(netHex: 0xf3f3f3)
    }
    
    class func settingBgColor() -> NSColor {
        return NSColor(netHex: 0xf2f2f2)
    }
}
