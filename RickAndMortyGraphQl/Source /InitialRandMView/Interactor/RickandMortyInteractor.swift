//
//  RickandMortyInteractor.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import Foundation

protocol RickandMortyInteracting : AnyObject {
    var presenter : RickandMortyPresenting? {get set}
    var getCharactersWorker: RandMCharactersWorker? {get set}
    
    func getCharacters ()
}

class RickandMortyInteractor : RickandMortyInteracting {
    var getCharactersWorker: RandMCharactersWorker?
    
    var presenter: RickandMortyPresenting?
    
    func getCharacters() {
        getCharactersWorker?.getCharacters()
    }
}

extension RickandMortyInteractor: RandMCharactersWorkerDelegate {
    func worker(_ worker: RandMCharactersWorking, completion: Result<[RandMCharactersModel], GraphAPIError>) {
        switch completion {
        case .success(let successData):
            presenter?.present(successData)
        case .failure(let failureError):
            presenter?.presentError(failureError.errorDes)
        }
    }
}
