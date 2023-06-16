//
//  dataFetcher.swift
//  Lab-fakeMockStub
//
//  Created by Mohanad Abbood on 6/16/23.
//

import Foundation

// Next, we'll define a class that will use the network service to fetch data
class DataFetcher {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchData(completion: @escaping (Data?) -> Void) {
        networkService.fetchData { data in
            completion(data)
        }
    }
}
