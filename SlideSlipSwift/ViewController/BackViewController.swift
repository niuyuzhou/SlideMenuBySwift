//
//  BackViewController.swift
//  SlideSlipSwift
//
//  Created by niuyuzhou on 15/8/22.
//  Copyright (c) 2015年 niuyuzhou. All rights reserved.
//

import UIKit

class BackViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置背景
        let imageView = UIImageView(image: UIImage(named: "back"))
        imageView.frame = UIScreen.mainScreen().bounds
        self.view.addSubview(imageView)
    }
}

