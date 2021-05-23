//
//  UIImageView+Extension.swift
//  mini
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience init(image:UIImage,gestureRecognizer:UITapGestureRecognizer,superView:UIView){
        self.init()
        self.image = image
        self.addGestureRecognizer(gestureRecognizer)
        superView.addSubview(self)
    }
    
}
