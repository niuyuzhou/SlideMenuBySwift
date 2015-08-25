//
//  LeftMenuTableViewCell.swift
//  SlideSlipSwift
//
//  Created by niuyuzhou on 15/8/24.
//  Copyright (c) 2015年 niuyuzhou. All rights reserved.
//

import UIKit

class LeftMenuTableViewCell: UITableViewCell {

    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel:UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadItem(contentTitle:String, icon: UIImage) {
        titleLabel.text = contentTitle
        iconImageView.image = icon
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
