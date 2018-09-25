//
//  ViewController.swift
//  demo4
//
//  Created by yang.zhang on 2018/9/23.
//  Copyright © 2018年 yang.zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count: Int = 0;
    let label: UILabel = UILabel();
    let addBtn: UIButton = UIButton();
    let subBtn: UIButton = UIButton();
    var width: CGFloat = CGFloat(0);
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        width = self.view.bounds.width;
        initLabel();
        initAddButton();
        initSubButton();
    }
    
    func initLabel() {
        label.text = String(count);
        label.frame = CGRect(x: 0, y: 50, width: width, height: 60);
        label.textAlignment = .center;
        self.view.addSubview(label);
    }
    
    func initAddButton() {
        let btnWidth: CGFloat = 100;
        addBtn.setTitle("add", for: .normal);
        addBtn.setTitleColor(UIColor.green, for: .normal);
        addBtn.setTitleColor(UIColor.red, for: .selected);
        addBtn.setTitleColor(UIColor.gray, for: .disabled);
        addBtn.frame = CGRect(x: (width - btnWidth)/2, y: 200, width: 100, height: 60);
        addBtn.layer.borderWidth = 1;
        addBtn.isEnabled = count < 10;
        addBtn.addTarget(self, action: #selector(ViewController.addHandler), for: .touchUpInside);
        self.view.addSubview(addBtn);
    }
    
    func initSubButton() {
        let btnWidth: CGFloat = 100;
        subBtn.setTitle("sub", for: .normal);
        subBtn.setTitleColor(UIColor.red, for: .normal);
        subBtn.setTitleColor(UIColor.gray, for: .disabled);
        subBtn.frame = CGRect(x: (width-btnWidth)/2, y: 300, width: 100, height: 60);
        subBtn.layer.borderWidth = 1;
        subBtn.isEnabled = count > 0;
        subBtn.addTarget(self, action: #selector(ViewController.subHandler), for: .touchUpInside);
        self.view.addSubview(subBtn);
    }
    
    @objc func addHandler() {
        count += 1;
        label.text = String(count);
        addBtn.isEnabled = count < 10;
        subBtn.isEnabled = true;
    }
    
    @objc func subHandler() {
        count -= 1;
        label.text = String(count);
        subBtn.isEnabled = count > 0;
        addBtn.isEnabled = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

