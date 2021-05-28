//
//  ZJBloodViewController.swift
//  mini
//
//  Created by Mac on 2017/5/19.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ZJBloodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "血压计"
        
         addBackButton()
        // Do any additional setup after loading the view.
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
