//
//  RickandMortyScene.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import Foundation


class RickandMortyScene {
    static func create () -> RickAndMortyVC {
        let viewController = RickAndMortyVC()
        let interactor = RickandMortyInteractor()
        let worker = RandMCharactersWorker()
        let presenter = RickandMortyPresentor()
        let router = RickandMortyRouter()
        let viewModel = RickAndMortyViewModel()
        
        viewController.interactor = interactor
        viewController.router = router
        viewController.viewModel = viewModel
        
        interactor.presenter = presenter
        interactor.getCharactersWorker = worker
        
        router.viewController = viewController
        
        worker.delegate = interactor
        worker.networkManager = NetworkManager.shared
        
        presenter.viewController = viewController
        return viewController
    }
}
