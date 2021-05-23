//
//  UIButton+Extension.swift
//  mini
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit


extension UIButton {
   
    convenience init(borderWidth:CGFloat = 0.5,bordeColor:UIColor = .black,redius:CGFloat = 0,backColor:UIColor = .white,image:UIImage,backImage:UIImage,font:CGFloat = 17,textAligent:NSTextAlignment = .center,target:Selector,title:String,titleColor:UIColor = .black,superView:UIView){
        self.init()
        self.layer.borderColor = bordeColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = redius
        self.layer.masksToBounds = true
        self.backgroundColor = backColor;
        self.setBackgroundImage(backImage, for: .normal)
        self.setImage(image, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: font)
        self.titleLabel?.textAlignment = textAligent;
        self.addTarget(self, action: target, for: .touchUpInside)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        superView.addSubview(self)
    }
    
}
