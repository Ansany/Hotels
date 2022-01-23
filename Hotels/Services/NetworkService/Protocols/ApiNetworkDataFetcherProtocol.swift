//
//  ApiNetworkDataFetcherProtocol.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

protocol ApiNetworkDataFetcherProtocol {
    init(networkDataFetcher: NetworkDataFetcherProtocol, urlService: ApiURLServiceProtocol)
    func fetchHotels(completion: @escaping (Result<[HotelFullInfoData]?, Error>) -> Void)
}
