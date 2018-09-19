//
//  ZyTabBarViewController.swift
//  demo2
//
//  Created by yang.zhang on 2018/9/19.
//  Copyright © 2018年 yang.zhang. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {

    convenience init(text: String, tag: Int){
        self.init();
        initTabBarItem(text: text,tag: tag);
        initLabelView(text: text);
    }
    
    func initTabBarItem(text: String,tag: Int) {
        let tabBarItem: UITabBarItem = UITabBarItem();
        tabBarItem.title = text;
        tabBarItem.tag = tag;
        tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.gray], for: .normal);
        tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.orange], for: .selected);
        self.tabBarItem = tabBarItem;
    }
    
    func initLabelView(text: String){
        let label : UILabel = UILabel();
        label.text = text;
        label.frame = self.view.frame;
        label.textColor = UIColor.white;
        label.textAlignment = .center;
        self.view.addSubview(label);
    }
}
