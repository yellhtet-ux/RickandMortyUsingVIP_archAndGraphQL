//
//  RickAndMortyVC.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import UIKit

protocol RickandMortyControlling : UIViewController {
    var interactor : RickandMortyInteracting? {get set}
    var router : RickandMortyRouting? {get set}
    var viewModel: RickAndMortyViewModel? {get set}
    
    func render (state: RickAndMortyVC.State)
}

class RickAndMortyVC: UIViewController {
    
    var interactor: RickandMortyInteracting?
    var router: RickandMortyRouting?
    var viewModel: RickAndMortyViewModel?
    
     var resultData : [RandMCharactersModel] = []

     let tableView = UITableView()
     let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getCharacters()
        configureHierarchy()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension RickAndMortyVC  {
    func configureHierarchy () {
        configureTableView()
        configureLabel ()
    }
    
    func configureTableView () {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 260
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName:"R&MTableViewCell" , bundle: nil), forCellReuseIdentifier: "rAndM_cell")
//        tableView.allowsSelection = false
    }
    
    func configureLabel () {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


