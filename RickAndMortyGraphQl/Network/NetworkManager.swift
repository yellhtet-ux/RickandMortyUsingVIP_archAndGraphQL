//
//  NetworkManager.swift
//  RickAndMortyGraphQl
//
//  Created by Andrew Hardin on 1/23/24.
//

import Foundation
import Apollo
import ApolloAPI
import RickAndMortyAPI


class NetworkManager {
      static let shared = NetworkManager()

      private(set) lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    
    public func fetcher <Query: GraphQLQuery> (query: Query, resultHandler: @escaping (Result<Query.Data,GraphAPIError>) -> Void) {
        self.apollo.fetch(query: query,queue: .global(qos: .background)) {  result in
            switch result {
            case let .success(data):
                guard let resultData = data.data else {return}
                DispatchQueue.main.async {
                    resultHandler(.success(resultData))
                }
            case  .failure(_):
                DispatchQueue.main.async {
                    resultHandler(.failure(.invalidData))
                }
            }
        }
     
    }
}

enum GraphAPIError : Error {
    case invalidData,invalidResponse,unknownError
    
    var errorDes: String {
        switch self {
        case .invalidData:
            return "No Data Available"
        case .invalidResponse:
            return "Response Data is invalid"
        case .unknownError:
            return "Unknown Error"
        }
    }
}
