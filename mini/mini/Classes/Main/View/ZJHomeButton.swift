//
//  ZJHomeButton.swift
//  mini
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ZJHomeButton: UIButton {

    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        
        return CGRect(x: 0, y: 0, width: 20, height: contentRect.height);
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        
        return CGRect(x: 25, y: 0, width: contentRect.width-25, height: contentRect.height);
    }
}
