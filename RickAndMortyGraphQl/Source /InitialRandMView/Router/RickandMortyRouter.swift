//
//  RickandMortyRouter.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import UIKit

protocol RickandMortyRouting: AnyObject {
    var viewController : RickandMortyControlling? {get set}
    func goToDetail(_ id: String)
}

class RickandMortyRouter: RickandMortyRouting {
    var viewController: RickandMortyControlling?
    
    func goToDetail(_ id: String) {
        print("This is Selected Character's ID: \(id)")
        let vc = RickAndMortyDetailScene.create(id)
        vc.modalPresentationStyle = .pageSheet
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
