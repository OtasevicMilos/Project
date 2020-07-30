//
//  InfoTableViewCell.swift
//  Project
//
//  Created by Milos Otasevic on 29/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    @IBOutlet weak var infoTextLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var shadowInfoView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.shadowInfoView.layer.cornerRadius = 10
        self.shadowInfoView.layer.shadowColor = #colorLiteral(red: 0.8392447829, green: 0.8863856792, blue: 0.9640881419, alpha: 1)
        self.shadowInfoView.layer.shadowRadius = 3
        self.shadowInfoView.layer.shadowOpacity = 3
    }
}
