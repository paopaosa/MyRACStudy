//
//  MRUserViewModel.swift
//  MyRACStudy
//
//  Created by macpps on 16/2/5.
//  Copyright © 2016年 PPS. All rights reserved.
//

import Cocoa

class MRUserViewModel: BaseViewModel {
    var tempUsername:String?
    
    override init() {
        
    }
    
    override var debugDescription: String{
        return String(format: "<Debug: {\n  className: %s\n}>", className)
    }
}
