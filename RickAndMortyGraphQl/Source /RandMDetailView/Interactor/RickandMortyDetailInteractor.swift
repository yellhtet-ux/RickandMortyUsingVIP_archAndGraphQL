//
//  RickandMortyDetailInteractor.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/24/24.
//

import Foundation

protocol RickandMortyDetailInteracting: AnyObject {
    var presenter : RickandMortyDetailPresenting? {get set}
    var detailWorker: RickandMortyDetailWorker? {get set}
    
    func getDetail(_ id: String)
}

class RickandMortyDetailInteractor : RickandMortyDetailInteracting {
    var presenter: RickandMortyDetailPresenting?
    
    var detailWorker: RickandMortyDetailWorker?
    
    func getDetail(_ id: String) {
        detailWorker?.getDetailData(id)
    }
}

extension RickandMortyDetailInteractor : RickandMortyDetailWorkerDelegate {
    func worker(_ worker: RickandMortyDetailWorking, completion: Result<RandMCharacterDetailModel, GraphAPIError>) {
        switch completion {
        case let .success(successData):
            self.presenter?.present(data: successData)
        case let .failure(failureData):
            self.presenter?.presentError(error: failureData.errorDes)
        }
    }
}
     
