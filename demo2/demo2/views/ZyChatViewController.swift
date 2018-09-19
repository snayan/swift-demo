//
//  ZyChatViewController.swift
//  demo2
//
//  Created by yang.zhang on 2018/9/18.
//  Copyright © 2018年 yang.zhang. All rights reserved.
//

import UIKit

class ZyChatViewController: ZyTabberController {
    
    let label: UILabel = UILabel();
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // 设置label
        label.frame = self.view.frame;
        label.textColor = UIColor.white;
        label.text = "chat view";
        label.textAlignment = .center;
        self.view.addSubview(label);
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}
