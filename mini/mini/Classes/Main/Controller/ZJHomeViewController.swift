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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    var rotationAnimation:CABasicAnimation = {
        
        let rot = CABasicAnimation(keyPath: "transform.rotation.z")
        rot.toValue = NSNumber(floatLiteral: M_PI * 2.0)
        rot.duration = 2.5
        rot.isCumulative = true
        rot.repeatCount = MAXFLOAT
        rot.isRemovedOnCompletion = false
        return rot
        
    }()
   
    private lazy var titleLabel:UILabel = {
        
         return UILabel(textColor: .black, text: "远程健康", fontSize: 25, superView: self.view)
        
    }()
    
    
    private lazy var blueToothLabel:UILabel = {
        
        return UILabel(textColor: .black, text: "蓝牙未开启", fontSize: 17, superView: self.view)
        
    }()
    
    private lazy var imageViewS:UIImageView = {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewSClick))
        let imageV:UIImageView = UIImageView(image: #imageLiteral(resourceName: "腕表"), superView: self.view)
        imageV.addGestureRecognizer(tap)
        imageV.isUserInteractionEnabled = true
        
        imageV.contentMode = .center
        return imageV

    }()
    
    private lazy var imageViewSCircle:UIImageView = {
    
        let imageV:UIImageView = UIImageView(image: #imageLiteral(resourceName: "椭圆腕表"), superView: self.view)
        imageV.isUserInteractionEnabled = false
        imageV.contentMode = .center
        imageV.layer.add(self.rotationAnimation, forKey: "rotationAnimation")
        return imageV
        
    }()
    
    private lazy var button1:ZJHomeButton = {
        
        let btn:ZJHomeButton = ZJHomeButton(image: UIImage(named:"叉")!, imageSelected:UIImage(named:"对号")!, font: 14, textAligent: .center, title: "设备未连接", titleSelected: "设备已连接", titleColor: .gray, superView: self.view)
       
        return btn
    }()
    
    private lazy var snLabel:UILabel = {
        
        let label:UILabel = UILabel(textColor: .black, text: "", fontSize: 14, superView: self.view)
        label.textAlignment = .center
        label.isHidden = true
        return label
        
    }()
    
    private lazy var imageViewX:UIImageView = {
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewXClick))
        let imageV:UIImageView = UIImageView(image: #imageLiteral(resourceName: "血压计"), gestureRecognizer: tap, superView: self.view)
        imageV.isUserInteractionEnabled = true
        imageV.contentMode = .center
        return imageV
        
    }()
    
    private lazy var imageViewXCircle:UIImageView = {
        
        let imageV:UIImageView = UIImageView(image:#imageLiteral(resourceName: "椭圆血压"), superView: self.view)
        imageV.isUserInteractionEnabled = false
        imageV.contentMode = .center
        imageV.layer.add(self.rotationAnimation, forKey: "rotationAnimation")
        return imageV
        
    }()
    
    private lazy var button2:ZJHomeButton = {
        
        let btn:ZJHomeButton = ZJHomeButton(image: UIImage(named:"叉")!, imageSelected:UIImage(named:"对号")!, font: 14, textAligent: .center, title: "设备未连接", titleSelected: "设备已连接", titleColor: .gray, superView: self.view)
        
        return btn
    }()
    
    private lazy var snLabel2:UILabel = {
        
        let label:UILabel = UILabel(textColor: .black, text: "", fontSize: 14, superView: self.view)
        label.textAlignment = .center
        label.isHidden = true
        return label
        
    }()
    
   @objc func imageViewSClick(tap:UIGestureRecognizer) {
        
        let tabbBarVc = ZJTabBarViewController()
        tabbBarVc.selectedIndex = 0
        present(tabbBarVc, animated: true, completion: nil)
    
    }
   @objc func imageViewXClick(tap:UIGestureRecognizer) {
        let tabbBarVc = ZJTabBarViewController()
        tabbBarVc.selectedIndex = 1
        present(tabbBarVc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(ZJTabBarViewController())
        configUI()
        
        
        // Do any additional setup after loading the view.
    }
    
    func configUI()  {
        
      view.backgroundColor = .white
        
        
      titleLabel.snp.makeConstraints { (make) in
        make.top.equalTo(self.view).offset(40)
        make.centerX.equalTo(self.view)
        make.height.equalTo(44)
      }
      
      blueToothLabel.snp.makeConstraints { (make) in
        make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
        make.centerX.equalTo(self.view)
        make.height.equalTo(44)
      }
      imageViewS.snp.makeConstraints { (make) in
        
        make.top.equalTo(self.blueToothLabel.snp.bottom).offset(10)
        make.height.equalTo(170)
        make.width.equalTo(170)
        make.centerX.equalTo(self.view)
      }
        
        imageViewSCircle.snp.makeConstraints { (make) in
             make.top.left.bottom.right.equalTo(imageViewS)
        }
      
        button1.snp.makeConstraints { (make) in
            make.top.equalTo(imageViewS.snp.bottom).offset(15);
            make.height.equalTo(20);
            make.centerX.equalTo(self.view);
            make.width.equalTo(120)
        }
        snLabel.snp.makeConstraints { (make) in
            make.top.equalTo(button1.snp.bottom).offset(0);
            make.height.equalTo(30);
            make.width.equalTo(250);
            make.centerX.equalTo(self.view);
        }
        imageViewX.snp.makeConstraints { (make) in
            make.top.equalTo(snLabel.snp.bottom).offset(10);
            make.height.equalTo(170);
            make.width.equalTo(170);
            make.centerX.equalTo(self.view);
        }
        imageViewXCircle.snp.makeConstraints { (make) in
           make.top.left.bottom.right.equalTo(imageViewX);
        }
        button2.snp.makeConstraints { (make) in
            make.top.equalTo(imageViewX.snp.bottom).offset(15);
            make.height.equalTo(20);
            make.centerX.equalTo(self.view);
            make.width.equalTo(120)
        }
        snLabel2.snp.makeConstraints { (make) in
            make.top.equalTo(button2.snp.bottom).offset(0);
            make.height.equalTo(30);
            make.width.equalTo(250);
            make.centerX.equalTo(self.view);
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
