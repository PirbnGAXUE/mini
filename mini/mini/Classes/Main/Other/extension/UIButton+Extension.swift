//
//  UIButton+Extension.swift
//  mini
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit


extension UIButton {
   
    convenience init(image:UIImage,imageSelected:UIImage,font:CGFloat = 17,textAligent:NSTextAlignment = .center,title:String,titleSelected:String,titleColor:UIColor = .black,superView:UIView){
        self.init()
        self.setImage(image, for: .normal)
        self.setImage(imageSelected, for: .selected)
        self.titleLabel?.font = UIFont.systemFont(ofSize: font)
        self.titleLabel?.textAlignment = textAligent;
        self.setTitle(title, for: .normal)
        self.setTitle(titleSelected, for: .selected)
        self.setTitleColor(titleColor, for: .normal)
        superView.addSubview(self)
    }
    
    
    convenience init(font:CGFloat = 17,textAligent:NSTextAlignment = .center,title:String,titleColor:UIColor = .black){
        self.init()
        self.titleLabel?.font = UIFont.systemFont(ofSize: font)
        self.titleLabel?.textAlignment = textAligent;
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        
    }
    
}
