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
    func fetchHotel(withHotelID id: Int, completion: @escaping (Result<HotelModel?, Error>) -> Void)
    func fetchImage(withID id: String, image: UIImageView) -> Void
}
