//
//  AppDelegate.swift
//  SlideSlipSwift
//
//  Created by niuyuzhou on 15/8/21.
//  Copyright (c) 2015年 niuyuzhou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var slideSlipVC: SlideSlipViewController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        slideSlipVC = SlideSlipViewController()
        
        var contentVC: ContentViewController!
        var contentNC: UINavigationController!
        
        slideSlipVC?.contentTitles = ["Chats","Favorites","Contacts","Status","Settings"]
        slideSlipVC?.contentImages = [UIImage(named: "qq")!, UIImage(named: "qq")!,UIImage(named: "qq")!,UIImage(named: "qq")!]
        
        for title in ["Chats","Favorites","Contacts","Status","Settings"] {
            contentVC = ContentViewController(nibName: "ContentViewController", bundle: nil)
            contentVC.myContent = title
            contentVC.delegate = slideSlipVC
            contentNC = UINavigationController(rootViewController: contentVC)
            
            slideSlipVC?.contentVCs.append(contentNC)
            //slideSlipVC?.contentVCs.append(contentVC)
        }
        slideSlipVC?.currentContentVC = slideSlipVC?.contentVCs[0]
        
        window?.rootViewController = slideSlipVC
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

