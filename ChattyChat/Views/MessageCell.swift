//
//  MessageCell.swift
//  ChattyChat
//
//  Created by Андрей Останин on 15.08.2020.
//  Copyright © 2020 Андрей Останин. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var senderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bodyView.layer.cornerRadius = bodyView.frame.size.height / 5
        bodyView.layer.shadowColor = UIColor.white.cgColor
        bodyView.layer.shadowOpacity = 0.5
        bodyView.layer.shadowOffset = CGSize(width: 1, height: 1)
        bodyView.layer.shadowRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
