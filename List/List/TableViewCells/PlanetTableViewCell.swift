//
//  PlanetTableViewCell.swift
//  List
//
//  Created by Aghish Babu on 16/02/22.
//

import UIKit

class PlanetTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var planetIdLabel: UILabel!
    @IBOutlet weak var planetNameLabel: UILabel!
    
    var planet : Result? {
        didSet {
            planetIdLabel.text = planet?.name
            planetNameLabel.text = planet?.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
