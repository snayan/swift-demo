//
//  ViewController.swift
//  demo1
//
//  Created by yang.zhang on 2018/9/12.
//  Copyright © 2018年 yang.zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // view
    let startButton = UIButton(type: UIButtonType.system);
    let stopButton = UIButton(type: UIButtonType.system);
    let resetButton = UIButton(type: UIButtonType.system);
    let countLabel = UILabel();
    // count
    var count = 0.0;
    var isPlaying = false;
    var timer = Timer();
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bounds = self.view.bounds;
        let width = bounds.width;
        let height = bounds.height;
        
        // init label
        countLabel.text = String(format: "%.1f", self.count);
        countLabel.textAlignment = .center;
        countLabel.textColor = UIColor.white;
        countLabel.frame = CGRect(x: 0, y: 0, width: width, height: height/2);
        countLabel.backgroundColor = UIColor.black;
        countLabel.font = UIFont.systemFont(ofSize: 48);
        countLabel.adjustsFontSizeToFitWidth = true;
        self.view.addSubview(countLabel);
        //sasas
        
        // init start button
        startButton.setTitle("开始", for: .normal);
        startButton.frame = CGRect(x: 0, y: countLabel.bounds.height, width: width/2, height: height/2);
        startButton.backgroundColor = UIColor.green;
        startButton.addTarget(self, action: #selector(startRecord), for: UIControlEvents.touchDown);
        self.view.addSubview(startButton);
        
        // init stop button
        stopButton.setTitle("停止", for: .normal);
        stopButton.setTitleColor(UIColor.red, for: .normal);
        stopButton.frame = CGRect(x: width/2, y: countLabel.bounds.height, width: width/2, height: height/2);
        stopButton.backgroundColor = UIColor.orange;
        stopButton.addTarget(self, action: #selector(stopRecord), for: .touchDown);
        self.view.addSubview(stopButton);
        
        // init reset button
        resetButton.setTitle("重置", for: .normal);
        resetButton.setTitleColor(UIColor.white, for: .normal);
        resetButton.frame = CGRect(x: width-100, y: 50, width: 50, height: 30);
        resetButton.addTarget(self, action: #selector(resetRecord), for: .touchDown);
        self.view.addSubview(resetButton);
        
    }
    
    @objc func startRecord() {
        if (isPlaying) {
            return;
        }
        startButton.isEnabled = false;
        stopButton.isEnabled = true;
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block:{ (_:Timer) in
            self.count += 0.1;
            self.countLabel.text = String(format: "%.1f", self.count);
        });
        isPlaying = true;
    }
    
    @objc func stopRecord() {
        startButton.isEnabled = true;
        stopButton.isEnabled = false;
        timer.invalidate();
        isPlaying = false;
    }
    
    @objc func resetRecord() {
        startButton.isEnabled = true;
        stopButton.isEnabled = false;
        count = 0.0;
        isPlaying = false;
        timer.invalidate();
        countLabel.text = String(format: "%.1f", count);
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

