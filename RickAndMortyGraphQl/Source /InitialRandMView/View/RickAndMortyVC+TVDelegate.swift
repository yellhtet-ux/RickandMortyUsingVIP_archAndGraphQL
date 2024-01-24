//
//  RickAndMortyVC+TVDelegate.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import UIKit

extension RickAndMortyVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.goToDetail(viewModel?.characters[indexPath.row].id ?? "")
    }
}
