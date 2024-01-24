//
//  RandMCharactersModel.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import Foundation
import RickAndMortyAPI

struct RandMCharactersModel {
    let id: String?
    let image: String?
    let name: String?
    let gender: String?
    let species: String?
    let location: Location?
    
    init(id: String?, image: String?, name: String?, gender: String?, species: String?, location: Location?) {
        self.id = id
        self.image = image
        self.name = name
        self.gender = gender
        self.species = species
        self.location = location
    }
    
    init (_ data: CharactersListQuery.Data.Characters.Result?) {
        self.id = data?.id
        self.gender = data?.gender
        self.image = data?.image
        self.location = Location.init(data?.location)
        self.species = data?.species
        self.name = data?.name
    }
}

struct Location {
    let id: String?
    let name: String?
    let dimension: String?
    
    init(id: String?, name: String?, dimension: String?) {
        self.id = id
        self.name = name
        self.dimension = dimension
    }
    
    init (_ data: CharactersListQuery.Data.Characters.Result.Location?) {
        self.name = data?.name
        self.id = data?.id
        self.dimension = data?.dimension
    }
}
