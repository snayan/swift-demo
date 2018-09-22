//
//  ViewController.swift
//  demo3
//
//  Created by yang.zhang on 2018/9/19.
//  Copyright © 2018年 yang.zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var width: CGFloat = 0;
    var height: CGFloat = 0;
    let margin : CGFloat = 10;
    let safeMargin: CGFloat = 20;
    let avatarView: UIImageView = UIImageView();
    let scrollView: UIScrollView = UIScrollView();
    let animateView: UIImageView = UIImageView();
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = self.view.frame;
        width = frame.width;
        height = frame.height;
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg"));
        
        createAvatar();
        createScrollImg();
        createAnimateImg();

    }
    
    func createAvatar() {
        let img = #imageLiteral(resourceName: "avatar");
        avatarView.image = img;
        avatarView.frame = CGRect(x: margin, y: margin + safeMargin, width: 100, height: 100*img.size.height/img.size.width);
        self.view.addSubview(avatarView);
        
    }
    
    func createScrollImg() {
        let img = #imageLiteral(resourceName: "walnut");
        let avatarFrame = avatarView.frame;
        let scrollViewFrame = CGRect(x: margin, y: avatarFrame.maxY+margin, width: width-margin*2, height: 200);
        scrollView.frame = scrollViewFrame
        scrollView.backgroundColor = UIColor.orange;
        var contentWidth : CGFloat = 0;
        for index in 0...3 {
            let h = scrollViewFrame.height - margin * 2;
            let w = h * img.size.width / img.size.height;
            let x = margin + (w + margin) * CGFloat(index);
            let y = margin;
            let subView = UIImageView(frame: CGRect(x: x , y: y, width: w, height: h))
            subView.image = img;
            scrollView.addSubview(subView);
            contentWidth += w + margin;
        }
        scrollView.contentSize = CGSize(width: contentWidth + margin, height: scrollViewFrame.height - margin * 2);
        self.view.addSubview(scrollView);
    }
    
    func createAnimateImg() {
        let animationImgs = [#imageLiteral(resourceName: "avatar"),#imageLiteral(resourceName: "walnut")];
        let scrollFrame = scrollView.frame;
        animateView.frame = CGRect(x: margin, y: scrollFrame.maxY+margin, width: width-margin*2, height: 200);
        animateView.animationImages = animationImgs;
        animateView.animationDuration = TimeInterval(3);
        animateView.startAnimating();
        self.view.addSubview(animateView);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

