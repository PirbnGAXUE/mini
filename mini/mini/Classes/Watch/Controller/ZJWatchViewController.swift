//
//  ZJWatchViewController.swift
//  mini
//
//  Created by Mac on 2017/5/19.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ZJWatchViewController: UIViewController {
    
    var isOpen:Bool = false
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "手环"
        let blueUnit = BleUtils.getInstance()
        
        blueUnit?.getPhooneBleUtilsState({ (s) in
            
            self.isOpen = s==0 ? false :true
            
            if Thread.isMainThread {
                
                self.upDateButtonStatus()
                
            }else{
                
                DispatchQueue.main.async(execute: {
                   
                    self.upDateButtonStatus()
                    
                })
            }
            
            self.isOpen==true ?  self.startScan(): ()
                
            
            
            
        })
        addBackButton()
        // Do any additional setup after loading the view.
    }
    
    
    func upDateButtonStatus() {
        
    }
    
    
    func startScan()  {
        
        
    }
    
    
    
    
    func addBackButton() {
        
        let btn:ZJNavButton = ZJNavButton(frame: CGRect(x: 0, y: 0, width: 19, height: 19))
        
        btn.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
    }
    
    @objc func back()  {
        dismiss(animated: true, completion: nil);
    }
    
    func backClick()  {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
