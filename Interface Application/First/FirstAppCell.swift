//
//  FirstAppCell.swift
//  Interface Application
//
//  Created by Леонид Лукашевич on 24.09.2020.
//  Copyright © 2020 Hutr0. All rights reserved.
//

import UIKit

class FirstAppCell: UITableViewCell {
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(object: Emoji) {
        self.emojiLabel.text = object.emoji
        self.nameLabel.text = object.name
        self.descriptionLabel.text = object.description
    }

}
