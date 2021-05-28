
//
//  ZJTabBarViewController.swift
//  mini
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit



class ZJTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
       
    }

    func addChildViewControllers() {
        
        addChildViewController(VieWContorller: ZJBloodViewController(), titleName:"血压计", imageName:"b")
        
        addChildViewController(VieWContorller: ZJWatchViewController(), titleName:"手环", imageName:"w")
    
    }
    
    func addChildViewController(VieWContorller:UIViewController, titleName:String,imageName:String) -> Void {
        
        VieWContorller.tabBarItem.selectedImage = UIImage(named: imageName)
    
        VieWContorller.tabBarItem.image = UIImage(named:imageName+"_ss")
        
        VieWContorller.title = titleName
        
        let nav = ZJBaseNavViewController()
        
        VieWContorller.view.backgroundColor = .white
        
        nav.addChildViewController(VieWContorller)
        
        addChildViewController(nav)
        
        
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
