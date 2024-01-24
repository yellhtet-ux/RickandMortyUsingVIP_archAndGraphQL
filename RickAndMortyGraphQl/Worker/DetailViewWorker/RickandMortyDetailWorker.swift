//
//  RickandMortyDetailWorker.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/24/24.
//

import Foundation
import RickAndMortyAPI

protocol RickandMortyDetailWorking : AnyObject {
    var networkManager : NetworkManager? {get set}
    var delegate : RickandMortyDetailWorkerDelegate? {get set}
    
    func getDetailData (_ id: String) 
}

protocol RickandMortyDetailWorkerDelegate {
    func worker (_ worker: RickandMortyDetailWorking, completion: Result<RandMCharacterDetailModel,GraphAPIError>) /// DEBUG: Need To Change Completion Type 
}

class RickandMortyDetailWorker: RickandMortyDetailWorking {    
    var networkManager: NetworkManager?
    var delegate: RickandMortyDetailWorkerDelegate?
    
    func getDetailData(_ id: String) {
        let query = CharacterQuery(characterId: id)
        networkManager?.apollo.fetch(query: query) { result in
            switch result {
            case let .success(grapData): 
                if let data = grapData.data?.character {
                    self.delegate?.worker(self, completion: .success(RandMCharacterDetailModel.init(data)))    
                }                
            case let .failure(grapError):
                if let error = grapError as? GraphAPIError {
                    self.delegate?.worker(self, completion: .failure(error))
                }
            }
        }
    }    
}
