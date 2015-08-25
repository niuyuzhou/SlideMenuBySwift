//
//  LeftViewController.swift
//  SlideSlipSwift
//
//  Created by niuyuzhou on 15/8/22.
//  Copyright (c) 2015年 niuyuzhou. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var delegate: SlideSlipViewControllerDelegate!
    var currentIndex: Int!
    var contentTitles = [String]()
    var contentImages = [UIImage]()
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        var nib = UINib(nibName: "LeftMenuTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "LeftMenuTableViewCell")
        self.view.frame = CGRectMake(0, 0, 320 * 0.78, UIScreen.mainScreen().applicationFrame.maxY)
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentTitles.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "CellIdentifier"
        var cell :UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? UITableViewCell
        
        cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)
        cell!.textLabel!.text = contentTitles[indexPath.row]
        cell!.backgroundColor = UIColor.clearColor()
        cell!.textLabel?.textColor = UIColor.whiteColor()
/*
        var cell:LeftMenuTableViewCell = tableView.dequeueReusableCellWithIdentifier("LeftMenuTableViewCell") as! LeftMenuTableViewCell
        cell.backgroundColor = UIColor.clearColor()
        var contentTitle = contentTitles[indexPath.row]
        //var contentImage = contentImages[indexPath.row]
        var icon = UIImage(named: "qq")
        cell.loadItem(contentTitle, icon: icon!)
*/
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        delegate.changeCurrentContentView(indexPath.row)
        println("You selected cell #\(indexPath.row)!")
    }
}
