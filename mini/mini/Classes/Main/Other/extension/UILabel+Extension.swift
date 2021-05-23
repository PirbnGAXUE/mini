//
//  UILabel+Extension.swift
//  Weibo28
//
//  Created by Apple on 16/5/13.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(textColor: UIColor,text:String, fontSize: CGFloat,superView:UIView) {
        self.init()
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.text = text
        superView.addSubview(self)
    }

}
