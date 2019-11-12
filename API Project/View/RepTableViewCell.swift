//
//  TodoTableViewCell.swift
//  AdvancedTableViewsFollowAlong
//
//  Created by Josh GImenes on 10/14/19.
//  Copyright © 2019 Patchwork. All rights reserved.
//

import UIKit

class RepTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
