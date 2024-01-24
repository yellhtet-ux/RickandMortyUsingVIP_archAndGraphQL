//
//  RickAndMortyDetailViewModel.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/24/24.
//

import Foundation

struct RickAndMortyDetailViewModel {
    var detailData : RandMCharacterDetailModel?
    var episodes: [Episode] = []
    var errorMessage : String?
}
