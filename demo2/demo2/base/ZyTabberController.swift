//
//  ZyTabController.swift
//  demo2
//
//  Created by yang.zhang on 2018/9/17.
//  Copyright © 2018年 yang.zhang. All rights reserved.
//

import UIKit

class ZyTabberController: UITabBarController, UITabBarControllerDelegate {
    
    let bgColors: [UIColor] = [UIColor.orange,UIColor.blue,UIColor.green,UIColor.brown];
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.orange;
        self.tabBar.backgroundColor = UIColor.white;
        
        self.addChildViewController(ChildViewController(text:"chat",tag:0));
        self.addChildViewController(ChildViewController(text:"contact",tag:1));
        self.addChildViewController(ChildViewController(text:"find",tag:2));
        self.addChildViewController(ChildViewController(text:"me",tag:3));
        self.selectedIndex = 0;
        
        self.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        viewController.view.backgroundColor = bgColors[viewController.tabBarItem.tag];
        viewController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: bgColors[viewController.tabBarItem.tag]], for: .selected);
    }
}
