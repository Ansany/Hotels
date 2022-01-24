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
    
    // Fetch data from .json with hotel ID - one hotel for HotelDetailVC (and for making hotel image link)
    public func fetchHotel(withHotelID id: Int, completion: @escaping (Result<HotelModel?, Error>) -> Void) {
        guard let url = urlService.getHotelURL(withHotelID: id) else { return }
        networkDataFetcher.fetchDecodedData(from: url, completion: completion)
    }
    
    // Fetch image with id from one hotel
    public func fetchImage(withID id: String, image: UIImageView) -> Void {
        guard let url = urlService.getHotelImageURL(withImageID: id) else { return }
        networkDataFetcher.fetchImage(withURL: url, image: image)
    }
}
