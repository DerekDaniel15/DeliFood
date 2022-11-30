//
//  CeldaTableViewCell.swift
//  DeliFood
//
//  Created by Daniel Derek Arredondo Asto on 29/11/22.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
