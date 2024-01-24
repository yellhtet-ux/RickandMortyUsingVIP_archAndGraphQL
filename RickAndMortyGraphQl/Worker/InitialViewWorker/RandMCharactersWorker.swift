//
//  RandMCharactersWorker.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import Foundation
import Apollo
import ApolloAPI
import RickAndMortyAPI

protocol RandMCharactersWorking : AnyObject {
    var networkManager : NetworkManager? {get set}
    var delegate : RandMCharactersWorkerDelegate? {get set}
    
    func getCharacters ()
}

protocol RandMCharactersWorkerDelegate {
    func worker (_ worker: RandMCharactersWorking,completion: Result<[RandMCharactersModel],GraphAPIError>)
}

class RandMCharactersWorker: RandMCharactersWorking {
    var networkManager: NetworkManager?
    
    var delegate: RandMCharactersWorkerDelegate?
    
    func getCharacters() {
        let query = CharactersListQuery()
        networkManager?.fetcher(query: query, resultHandler: { result in
            switch result {
            case .success(let successData):
                if let characters = successData.characters?.results?.compactMap (RandMCharactersModel.init) {
                    self.delegate?.worker(self, completion: .success(characters))                    
                }
            case .failure(let failureData):
                self.delegate?.worker(self, completion: .failure(failureData))
            }
        })
    }
    
    
}
