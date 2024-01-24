//
//  RandMCharacterDetailModel.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/24/24.
//

import Foundation
import RickAndMortyAPI

struct RandMCharacterDetailModel {
    let id: String?
    let name: String?
    let species: String?
    let gender: String?
    let image: String?
    let location: DetailLocation?
    let episode: [Episode]?
    
    init(id: String?, name: String?,species: String?, gender: String?, image: String?, location: DetailLocation?, episode: [Episode]?) {
        self.id = id
        self.name = name
        self.species = species
        self.gender = gender
        self.image = image
        self.location = location
        self.episode = episode
    }
    
    init (_ data: CharacterQuery.Data.Character) {
        self.id = data.id
        self.name = data.name   
        self.gender = data.gender
        self.species = data.species
        self.location = DetailLocation.init(data.location)
        self.image = data.image
        self.episode = data.episode.compactMap(Episode.init)
    }
}

struct DetailLocation {
    let id: String?
    let name: String?
    let dimension: String?
    
    init(id: String?, name: String?, dimension: String?) {
        self.id = id
        self.name = name
        self.dimension = dimension
    }
    
    init (_ data: CharacterQuery.Data.Character.Location?) {
        self.name = data?.name
        self.id = data?.id
        self.dimension = data?.dimension
    }
}

struct Episode {
    let id: String?
    let air_date: String?
    let name: String?
    let created: String?
    let episode: String?
    
    init(id: String?, air_date: String?, name: String?, created: String?, episode: String?) {
        self.id = id
        self.air_date = air_date
        self.name = name
        self.created = created
        self.episode = episode
    }
    
    init (_ data: CharacterQuery.Data.Character.Episode?) {
        self.id = data?.id  
        self.name = data?.name   
        self.air_date = data?.air_date
        self.episode = data?.episode
        self.created = data?.created
    }
}
