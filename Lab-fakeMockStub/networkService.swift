//
//  networkService.swift
//  Lab-fakeMockStub
//
//  Created by Mohanad Abbood on 6/16/23.
//

import Foundation

// First, we'll define a protocol for the network service that our class will use
protocol NetworkService {
    func fetchData(completion: (Data?) -> Void)
}

class FakeNetworkService: NetworkService {
    func fetchData(completion: (Data?) -> Void) {
        completion(nil)
    }
}

class MockNetworkService: NetworkService {
    var fetchDataCalled = false
    
    func fetchData(completion: (Data?) -> Void) {
        fetchDataCalled = true
    }
}

class StubNetworkService: NetworkService {
    
    let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    func fetchData(completion: (Data?) -> Void) {
        let data = Data()
        completion(data)
    }
}
