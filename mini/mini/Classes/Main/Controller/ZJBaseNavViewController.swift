//
//  ZJBaseNavViewController.swift
//  mini
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ZJBaseNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationBar.isTranslucent = false
//        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navigationBar.shadowImage = UIImage()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count>0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
            addBackButton()
        }
        super.pushViewController(viewController, animated: animated)
    }

    func addBackButton() {
        
        let btn:ZJNavButton = ZJNavButton(frame: CGRect(x: 0, y: 0, width: 199, height: 19))
        
        btn.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
    }
    
    @objc func back()  {
        navigationController?.popViewController(animated: true)
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
