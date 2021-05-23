//
//  ZJBaseViewController.swift
//  mini
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import SnapKit


extension UIViewController {
    
    private func showNoDataView(_ belowView: UIView?)  {
        
        let tempView = UIView()
        tempView.isHidden = false
        tempView.tag = 300
        self.view.addSubview(tempView)
        
        let label = UILabel()
        label.text = "暂无数据"
        tempView.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        let img = UIImageView(image: UIImage(named: "YCNoDataImage"))
        
        tempView.addSubview(img)
        
        img.snp.makeConstraints { (make) in
            
            make.centerX.equalToSuperview()
            make.bottom.equalTo(label.snp.top).offset(-20)
            make.size.equalTo(CGSize(width: 90, height: 130))
        }
        
        if let temp = belowView  {
            
            self.view.insertSubview(tempView, belowSubview: temp)
            
        } else {
            
            self.view.addSubview(tempView)
        }
        
        
        tempView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        

}
    //MARK: 隐藏暂无数据页
    func hideTempView()  {
        
        let  findTempView = self.view.viewWithTag(300)
        
        findTempView?.isHidden = true
        
    }
    
    //MARK: 当self.view有需要悬浮于暂无数据视图使用
    func showNoDataViewAbove(_ belowView: UIView)  {
        
        showNoDataView(belowView)
    }
    
    //MARK: 直接显示暂无数据页
    func showNoDataView() {
        
        showNoDataView(nil)
        
    }
    
    
    
    
    
    
}

