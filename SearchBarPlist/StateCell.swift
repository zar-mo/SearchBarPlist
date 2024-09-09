//
//  StateCell.swift
//  SearchBarPlist
//
//  Created by Abouzar Moradian on 9/9/24.
//

import UIKit

class StateCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    static let identifier = "StateCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
