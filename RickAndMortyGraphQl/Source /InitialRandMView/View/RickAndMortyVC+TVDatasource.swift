//
//  RickAndMortyVC+TVDatasource.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import UIKit

extension RickAndMortyVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.characters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rAndM_cell", for: indexPath)  as! R_MTableViewCell
        cell.charactesViewModel = viewModel?.characters[indexPath.row]
        return cell
    }
}
