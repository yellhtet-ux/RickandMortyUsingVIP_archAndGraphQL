//
//  RickandMortyPresentor.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import UIKit

protocol RickandMortyPresenting : AnyObject {
    var viewController : RickandMortyControlling? {get set}
    
    func present(_ data: [RandMCharactersModel])
    func presentError (_ error: String)
}


class RickandMortyPresentor : RickandMortyPresenting {
    var viewController: RickandMortyControlling?
    
    func present(_ data: [RandMCharactersModel]) {
        viewController?.render(state: .successRendering(data))
    }
    
    func presentError(_ error: String) {
        viewController?.render(state: .errorRendering(error))
    }
}
