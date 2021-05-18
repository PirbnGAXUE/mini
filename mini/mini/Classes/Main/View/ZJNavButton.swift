//
//  ZJNavButton.swift
//  mini
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ZJNavButton: UIButton {

    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        
        return CGRect(x: 6, y: 0, width: 11, height: 19);
        
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        
        return CGRect(x: 6, y: 0, width: 11, height: 19);
        
    }

}
