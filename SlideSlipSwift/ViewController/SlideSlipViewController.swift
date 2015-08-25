//
//  SlideSlipViewController.swift
//  SlideSlipSwift
//
//  Created by niuyuzhou on 15/8/23.
//  Copyright (c) 2015年 niuyuzhou. All rights reserved.
//

import UIKit

protocol SlideSlipViewControllerDelegate {
    func showLeft()
    func showContent()
    func changeCurrentContentView(index: Int)
}


class SlideSlipViewController: UIViewController, SlideSlipViewControllerDelegate {

    var leftMenuVC:LeftMenuViewController!
    var currentContentVC:UIViewController!
    var contentVCs = [UIViewController]()
    var contentTitles = [String]()
    var contentImages = [UIImage]()
    var currentContentIndex:Int = 0
    
    var backgroundImage: UIImage!
    
    var currentView: UIView!
    
    var distance: CGFloat = 0
    
    var contentContainerView: UIView!
    
    var slideSlipViewControllerDelegate: SlideSlipViewControllerDelegate!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nil, bundle: nil)
        
        // 缺省的主视图背景图
        backgroundImage = UIImage(named: "back")

        // LeftMenu
        self.leftMenuVC = LeftMenuViewController(nibName: "LeftMenuViewController", bundle: nil)
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slideSlipViewControllerDelegate = self
        
        self.leftMenuVC.contentImages = self.contentImages
        self.leftMenuVC.contentTitles = self.contentTitles
        self.leftMenuVC.delegate = self

        // 设定主视图设置背景
        let backgroundImageView = UIImageView(image: self.backgroundImage)
        backgroundImageView.frame = UIScreen.mainScreen().bounds
        self.view.addSubview(backgroundImageView)

        // 增加左侧菜单视图
        self.addChildViewController(self.leftMenuVC)
        self.view.addSubview(self.leftMenuVC.view)
        self.didMoveToParentViewController(self)

        // 增加内容视图容器
        self.contentContainerView = UIView(frame: self.view.frame)
        self.view.addSubview(self.contentContainerView)
        
        // 增加缺省内容视图

        for content:UIViewController in self.contentVCs {
            self.addChildViewController(content)
            //self.contentContainerView.addSubview(content.view)
            self.didMoveToParentViewController(self)
            //self.currentContentVC = content
        }
        self.contentContainerView.addSubview(self.contentVCs[self.contentVCs.count-1].view)
        self.currentContentVC = self.contentVCs[self.contentVCs.count-1]
        
        // 绑定Gesture
        var panGestureRecognizer:UIPanGestureRecognizer = UIPanGestureRecognizer()
        panGestureRecognizer.addTarget(self, action: Selector("panGestureRecognized:"))
        
        self.contentContainerView.addGestureRecognizer(panGestureRecognizer)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeContent() {
        
    }
    
    func panGestureRecognized(recongnizer: UIPanGestureRecognizer) {
        let x = recongnizer.translationInView(self.view).x
        distance = distance + x // 实时距离
        
        if recongnizer.state == UIGestureRecognizerState.Ended {
            if distance > 240 {
                slideSlipViewControllerDelegate.showLeft()
            }
            else {
                slideSlipViewControllerDelegate.showContent()
            }
        }
        
        recongnizer.view?.center =
            CGPoint(x:recongnizer.view!.center.x + x, y:recongnizer.view!.center.y)
        // 下列方法允许重置UIPanGestureRecognizer的增量
        recongnizer.setTranslation(CGPointZero, inView: self.view)
    }
    
    func showLeft() {
        distance = 240
        //doTheAnimate("left")
        contentContainerView.center.x = 160+240
    }
    
    func showContent() {
        distance = 0
        //doTheAnimate("Content")
        contentContainerView.center.x = 160
    }
    
    func doTheAnimate(showWhat: String) {
    }

    func changeCurrentContentView(index: Int) {
        self.currentContentVC.view.removeFromSuperview()
        self.currentContentVC = self.contentVCs[index]
        self.contentContainerView.addSubview(self.currentContentVC.view)
        showContent()
        //[UIView exchangeSubviewAtIndex:indexA withSubviewAtIndex:indexB]
//        self.contentContainerView.exchangeSubviewAtIndex(index1: Int, withSubviewAtIndex: <#Int#>)
//        self.currentContentVC.view.exchangeSubviewAtIndex(<#index1: Int#>, withSubviewAtIndex: <#Int#>)

    }
}
