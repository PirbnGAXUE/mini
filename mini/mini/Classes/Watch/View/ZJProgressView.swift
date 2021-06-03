//
//  ZJProgressView.swift
//  mini
//
//  Created by Mac on 2017/5/19.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ZJProgressView: UIView {
    
    
    var circelRadius:CGFloat = 0.0
    
    var bottomLayer:CAShapeLayer?
    
    var lineWidth:CGFloat = 0.0
    

    override init(frame: CGRect) {
        
        super.init(frame: frame)
      
         self.setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI()  {
        
        //画圆
        //圆的直径
        self.circelRadius = self.frame.size.width - 130.0
        self.lineWidth = 2.0;
        let Rad:CGFloat = CGFloat((self.circelRadius - self.lineWidth) / 2);
        
        let tickPath:UIBezierPath = UIBezierPath(arcCenter: CGPoint(x: self.width / 2, y:  self.height * 0.5), radius: Rad, startAngle: CGFloat(degreesToRadians(rod: 0)), endAngle: degreesToRadians(rod: 360), clockwise: true)
      
        
        // 底色
        self.bottomLayer = CAShapeLayer()
        self.bottomLayer?.frame = self.bounds
        self.bottomLayer?.fillColor = UIColor.clear.cgColor
        self.bottomLayer?.strokeColor = UIColor.cz_color(withHex: 0xe8e8e8).cgColor
        self.bottomLayer?.opacity = 0.5
        self.bottomLayer?.lineCap = kCALineCapButt
        self.bottomLayer?.lineWidth = self.lineWidth
        self.bottomLayer?.path = tickPath.cgPath
        self.layer.addSublayer(self.bottomLayer!)
        
    }

    func degreesToRadians(rod:CGFloat) -> CGFloat {
        
        return (CGFloat(M_PI)*CGFloat(x))/CGFloat(180.0)
    }

    func drawScale() {

        let perAngle = Float(2*M_PI) / 250
        let calWidth = Float(perAngle) / 4;
        
        for i in 0...249 {
            
            let startAngel = Float(-M_PI) + perAngle*Float(i)
            let endAngel = startAngel + calWidth;
            let tickPath:UIBezierPath = UIBezierPath(arcCenter: self.center, radius: self.height * 0.5, startAngle: CGFloat(startAngel), endAngle: CGFloat(endAngel), clockwise: true)
            let shap:CAShapeLayer = CAShapeLayer()
            shap.strokeColor = UIColor(colorLiteralRed: 99/255.0, green: 200/255.0, blue: 252/255.0, alpha: 1.0).cgColor
            shap.lineWidth = 9
            shap.path = tickPath.cgPath
            self.layer.addSublayer(shap)
            
        }
    }

}
