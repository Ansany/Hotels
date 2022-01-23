//
//  ApiNetworkDataFetcher.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

struct ApiNetworkDataFetcher: ApiNetworkDataFetcherProtocol {
    
    //MARK: - Private properties
    private var networkDataFetcher: NetworkDataFetcherProtocol
    private var urlService: ApiURLServiceProtocol
    
    //MARK: - Initializer
    init(networkDataFetcher: NetworkDataFetcherProtocol = NetworkDataFetcher(), urlService: ApiURLServiceProtocol = ApiURLService()) {
        self.networkDataFetcher = networkDataFetcher
        self.urlService = urlService
    }
    
    //MARK: - Public methods
    public func fetchHotels(completion: @escaping (Result<[HotelFullInfoData]?, Error>) -> Void) {
        guard let url = urlService.getHotelsURL() else { return }
        networkDataFetcher.fetchDecodedData(from: url, completion: completion)
    }
    
    
}
