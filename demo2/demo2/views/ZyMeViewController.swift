//
//  ZyMeViewController.swift
//  demo2
//
//  Created by yang.zhang on 2018/9/18.
//  Copyright © 2018年 yang.zhang. All rights reserved.
//

import UIKit

class ZyMeViewController: ZyTabberController {
    
    let label: UILabel = UILabel();
    override func viewDidLoad() {
        super.viewDidLoad();
        // 设置title
        self.title = "me title";
        
        // 设置label
        label.frame = self.view.frame;
        label.text = "me view";
        label.textColor = UIColor.yellow;
        label.textAlignment = .center;
        self.view.addSubview(label);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}
