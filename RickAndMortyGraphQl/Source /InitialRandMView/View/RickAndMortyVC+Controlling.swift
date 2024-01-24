//
//  RickAndMortyVC+Controlling.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import Foundation

extension RickAndMortyVC: RickandMortyControlling {
    func render(state: State) {
        switch state {
        case .successRendering(let data):
            showRandMCharacter(data)
            
        case .errorRendering(let error):
            if error != "" {
                showRandMCharacterError(error)
            }
        }
    }
    
    private func showRandMCharacter (_ characters: [RandMCharactersModel]) {
        viewModel?.characters = characters
        if let characters = viewModel?.characters {
            self.resultData = characters
        }
        tableView.reloadData()
        label.isHidden = true
    }
    
    private func showRandMCharacterError (_ characterError: String) {
        viewModel?.errorMessage = characterError
        self.tableView.isHidden = true
        self.label.isHidden = false
        self.label.text = viewModel?.errorMessage
    }
    
}


extension RickAndMortyVC  {
    enum State {
        case successRendering([RandMCharactersModel])
        case errorRendering(String)
    }
}
