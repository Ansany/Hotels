//
//  ApiNetworkDataFetcher.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import UIKit

struct ApiNetworkDataFetcher: ApiNetworkDataFetcherProtocol {
    
    //MARK: - Private properties
    private var networkDataFetcher: NetworkDataFetcherProtocol
    private var urlService: URLServiceProtocol
    
    //MARK: - Initializer
    init(networkDataFetcher: NetworkDataFetcherProtocol = NetworkDataFetcher(), urlService: URLServiceProtocol = URLService()) {
        self.networkDataFetcher = networkDataFetcher
        self.urlService = urlService
    }
    
    //MARK: - Public methods
    
    // Fetch data from .json with URL - all hotels for HotelsListVC
    public func fetchHotels(completion: @escaping (Result<[HotelFullInfoData]?, Error>) -> Void) {
        guard let url = urlService.getHotelsURL() else { return }
        networkDataFetcher.fetchDecodedData(from: url, completion: completion)
    }
    
    // Fetch image with id from one hotel
    public func fetchImage(withHotelID id: Int, imgID: String, image: UIImageView) -> Void {
        guard let url = urlService.getHotelImageURL(withHotelID: id, imgID: imgID) else { return }
        networkDataFetcher.fetchImage(withURL: url, image: image)
    }
}
