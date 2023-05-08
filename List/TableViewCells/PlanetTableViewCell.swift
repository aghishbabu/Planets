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
    @IBOutlet weak var plPopulation: UILabel!
    
    var planet : Result? {
        didSet {
            planetNameLabel.text = planet?.name
            plPopulation.text = planet?.population
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
