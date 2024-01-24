//
//  RickAndMortyDetailVC.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/24/24.
//

import UIKit

protocol RickandMortyDetailControlling: UIViewController {
    var interactor: RickandMortyDetailInteracting? {get set}
    var viewModel: RickAndMortyDetailViewModel? {get set}
    
    func render(state: RickAndMortyDetailVC.State)
}

class RickAndMortyDetailVC: UIViewController {
    
    @IBOutlet weak var episodeTableView: UITableView!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var speciesLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var avaterImg: UIImageView!
    
    var interactor: RickandMortyDetailInteracting? 
    var viewModel : RickAndMortyDetailViewModel?
    
    var characterID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureHierarchy()
        interactor?.getDetail(characterID)
    }
}


