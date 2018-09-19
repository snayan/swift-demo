//
//  ZyContactViewController.swift
//  demo2
//
//  Created by yang.zhang on 2018/9/18.
//  Copyright © 2018年 yang.zhang. All rights reserved.
//

import UIKit

class ZyContactViewController: ZyTabberController {
    
    let label: UILabel = UILabel();
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // 设置标题
//        self.title = "contact title";
        
        // 设置label
        label.frame = self.view.frame;
        label.text = "contact view";
        label.textColor = UIColor.red;
        label.textAlignment = .center;
        self.view.addSubview(label);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}
