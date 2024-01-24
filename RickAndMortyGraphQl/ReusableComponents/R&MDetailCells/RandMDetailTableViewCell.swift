//
//  RandMDetailTableViewCell.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/24/24.
//

import UIKit

class RandMDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
