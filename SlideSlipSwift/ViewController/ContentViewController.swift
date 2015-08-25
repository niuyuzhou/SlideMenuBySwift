//
//  HomeViewController.swift
//  
//
//  Created by niuyuzhou on 15/8/21.
//
//

import UIKit

class ContentViewController: UIViewController {
    var delegate: SlideSlipViewControllerDelegate!
    @IBOutlet var content:UILabel!
    var myContent:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "navigationcontroller" // 设置navigationbar上的现实内容
        self.navigationController?.navigationBar.barTintColor = UIColor.blueColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem()
        self.navigationItem.leftBarButtonItem?.title = "Menu"
        self.navigationItem.leftBarButtonItem?.target = self
        self.navigationItem.leftBarButtonItem?.action = Selector("showMenu")
        
        //self.navigationBarAppearace.barTintColor = UIColor(hex: 0x25b6ed)
        content.text = myContent
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let centerX = self.view.center.x
        println("---\(centerX)---")
    }

    func showMenu() {
        self.navigationItem.leftBarButtonItem?.title = myContent
        delegate.showLeft()
        self.navigationItem.leftBarButtonItem?.action = Selector("showContent")
    }

    func showContent() {
        self.navigationItem.leftBarButtonItem?.title = "Menu"
        delegate.showContent()
        self.navigationItem.leftBarButtonItem?.action = Selector("showMenu")
    }
}
