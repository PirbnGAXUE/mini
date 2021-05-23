//
//  ZJHomeViewController.swift
//  mini
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import SnapKit

class ZJHomeViewController: UIViewController {
    
   
    private lazy var titleLabel:UILabel = {
        
         return UILabel(textColor: .black, text: "远程健康", fontSize: 25, superView: self.view)
        
    }()
    
    
    private lazy var blueToothLabel:UILabel = {
        
        return UILabel(textColor: .black, text: "蓝牙未开启", fontSize: 17, superView: self.view)
        
    }()
    
    private lazy var imageViewS:UIImageView = {
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewSClick))
        let imageV:UIImageView = UIImageView(image: #imageLiteral(resourceName: "腕表"), gestureRecognizer: tap, superView: self.view)
        imageV.isUserInteractionEnabled = false
        
        return imageV

    }()
    
    private lazy var button1:ZJHomeButton = {
        
        return ZJHomeButton(borderWidth: 0, bordeColor: .black, redius: 0, backColor: .white, image: <#T##UIImage#>, backImage: <#T##UIImage#>, font: <#T##CGFloat#>, textAligent: <#T##NSTextAlignment#>, target: <#T##Selector#>, title: <#T##String#>, titleColor: <#T##UIColor#>, superView: <#T##UIView#>)
        
    }()
    
    func imageViewSClick(tap:UIGestureRecognizer) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
    }
    
    func configUI()  {
        
      view.backgroundColor = .red
        
        
      titleLabel.snp.makeConstraints { (make) in
        make.top.equalTo(self.view).offset(40)
        make.centerX.equalTo(self.view)
        make.height.equalTo(44)
      }
      
      blueToothLabel.snp.makeConstraints { (make) in
        make.top.equalTo(self.view).offset(40)
        make.centerX.equalTo(self.view)
        make.height.equalTo(44)
      }
        
        
          
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
