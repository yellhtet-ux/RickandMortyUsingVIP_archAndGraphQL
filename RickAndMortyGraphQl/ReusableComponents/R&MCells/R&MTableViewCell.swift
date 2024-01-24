//
//  R&MTableViewCell.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import UIKit
import SDWebImage

class R_MTableViewCell: ReusableTableViewCell {
    
    @IBOutlet weak var characterImg: UIImageView!
    @IBOutlet weak var dimensionLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var speciesLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    static let reuseIdentifier = "R_MTableViewCell";
    
    public var charactesViewModel :  RandMCharactersModel? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        super.addSeparator()
    }  
    
    private func updateUI () {
        self.nameLbl.text = "Name: \(charactesViewModel?.name ?? "")"
        self.speciesLbl.text = "Species: \(charactesViewModel?.species ?? "")"
        self.dimensionLbl.text = "Dimension: \(charactesViewModel?.location?.dimension ?? "")"
        self.genderLbl.text = "Gender: \(charactesViewModel?.gender ?? "")"
        self.locationLbl.text = "Location: \(charactesViewModel?.location?.name ?? "")"
        guard let url = URL(string: charactesViewModel?.image ?? "") else {return}
        self.characterImg.sd_setImage(with: url)
    }
}
