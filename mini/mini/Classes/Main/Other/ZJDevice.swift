//
//  ZJDevice.swift
//  mini
//
//  Created by Mac on 2017/5/19.
//  Copyright © 2017年 Mac. All rights reserved.
//

import Foundation

final class ZJDevice:NSObject{
    
    static let instance = ZJDevice()
    
    private override init() {
       
       bracelet = UserDefaults.kDevice.bracelet.value as!String? ?? ""
       loodSnPre = UserDefaults.kDevice.loodSnPre.value as!String? ?? ""
    }
    

    
    var bracelet: String?{
        
        didSet{
            UserDefaults.kDevice.bracelet.store(value: bracelet)
        }
    }
    
    var loodSnPre:String?{
        
        didSet{
            UserDefaults.kDevice.loodSnPre.store(value: loodSnPre)
        }
    }
    
    
}
