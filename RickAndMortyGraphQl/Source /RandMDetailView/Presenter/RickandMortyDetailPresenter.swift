//
//  RickandMortyDetailPresenter.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/24/24.
//

import Foundation

protocol RickandMortyDetailPresenting : AnyObject {
    var viewController : RickandMortyDetailControlling? {get set}
    
    func present(data: RandMCharacterDetailModel)
    func presentError (error: String)
}

class RickandMortyDetailPresenter: RickandMortyDetailPresenting {
    var viewController: RickandMortyDetailControlling?
    
    func present(data: RandMCharacterDetailModel) {
        viewController?.render(state: .showSuccessDetailData(data))
    }
    
    func presentError(error: String) {
        viewController?.render(state: .showFailureDetailData(error))
    }
   
}
