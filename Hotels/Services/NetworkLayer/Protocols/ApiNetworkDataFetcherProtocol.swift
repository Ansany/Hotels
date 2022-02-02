//
//  ApiNetworkDataFetcherProtocol.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import UIKit

protocol ApiNetworkDataFetcherProtocol {
    init(networkDataFetcher: NetworkDataFetcherProtocol, urlService: URLServiceProtocol)
    func fetchHotels(completion: @escaping (Result<[HotelFullInfoData]?, Error>) -> Void)
    func fetchImage(withHotelID id: Int, imgID: String, image: UIImageView) -> Void
}
