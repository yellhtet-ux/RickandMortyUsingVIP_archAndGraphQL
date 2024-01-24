//
//  RickAndMortyDetailScene.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/24/24.
//

import Foundation
import UIKit    

class RickAndMortyDetailScene  {
    static func create(_ id: String) -> RickAndMortyDetailVC {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "randM_detail") as! RickAndMortyDetailVC
        let interactor = RickandMortyDetailInteractor()
        let worker = RickandMortyDetailWorker()
        let presenter = RickandMortyDetailPresenter()
        let viewModel = RickAndMortyDetailViewModel()
        
        viewController.interactor = interactor
        viewController.characterID = id
        viewController.viewModel = viewModel
        
        interactor.detailWorker = worker
        interactor.presenter = presenter
        
        worker.networkManager = NetworkManager.shared
        worker.delegate = interactor
        
        presenter.viewController = viewController
        
        return viewController
    }
}
