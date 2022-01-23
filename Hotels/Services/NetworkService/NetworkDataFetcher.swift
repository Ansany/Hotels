//
//  NetworkDataFetcher.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

struct NetworkDataFetcher: NetworkDataFetcherProtocol {
    
    //MARK: - Private Properties
    private var networkService: NetworkServiceProtocol
    
    //MARK: - Initializer
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    //MARK: - Public methods
    public func fetchData(from url: URL, completion: @escaping (Result<Data?, Error>) -> Void) {
        networkService.request(url: url, completion: completion)
    }
    
    public func fetchDecodedData<T>(from url: URL, completion: @escaping (Result<T?, Error>) -> Void) where T: Decodable {
        networkService.request(url: url) { result in
            switch result {
            case .success(let data):
                let decodedData = JSONDecoder.getDecodedData(type: T.self, from: data)
                completion(.success(decodedData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
