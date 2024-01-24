//
//  RickandMortyDetailVC+Controlling.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/24/24.
//

import UIKit

extension RickAndMortyDetailVC {
    func configureHierarchy () {
        configureTableView()
    }
    
    func configureTableView () {
        self.episodeTableView.dataSource = self
        self.episodeTableView.register(UINib(nibName: "RandMDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.episodeTableView .rowHeight = 80
        self.episodeTableView.allowsSelection = false
    }
}

extension RickAndMortyDetailVC  {
    enum State {
        case showSuccessDetailData(RandMCharacterDetailModel),showFailureDetailData(String)
    }
}

extension RickAndMortyDetailVC : RickandMortyDetailControlling {
    func render(state: State) {
        switch state {
        case .showSuccessDetailData(let randMCharacterDetailModel):
            showSuccessDetailData(data: randMCharacterDetailModel)
        case .showFailureDetailData(let errorStr):
            showFailureDetailData(error: errorStr)
        }
    }
    
    private func showSuccessDetailData (data: RandMCharacterDetailModel) {
        viewModel?.detailData = data
        if let episode = data.episode {
            self.viewModel?.episodes += episode
        }
        guard let url = URL(string: viewModel?.detailData?.image ?? "") else {return}
        self.avaterImg.sd_setImage(with: url)
        self.nameLbl.text = "Name - \(viewModel?.detailData?.name ?? "")"
        self.genderLbl.text = "Gender - \(viewModel?.detailData?.gender ?? "")"
        self.speciesLbl.text = "Species - \(viewModel?.detailData?.species ?? "")"
        self.episodeTableView.reloadData()
    }
    
    private func showFailureDetailData (error: String)
    {
        viewModel?.errorMessage =  error
        print("This is View's Error: \(viewModel?.errorMessage ?? "")")    
    }
}

extension RickAndMortyDetailVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.episodes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RandMDetailTableViewCell
        cell.episodeName.text  = viewModel?.episodes[indexPath.row].name
        cell.episodeNumber.text = viewModel?.episodes[indexPath.row].episode 
        return cell
    }    
}
