//
//  NetworkDataFetcher.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import UIKit
import Kingfisher

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
    
    public func fetchImage(withURL url: URL, image: UIImageView) -> Void {
        image.kf.indicatorType = .activity
        image.kf.indicator?.startAnimatingView()
        image.kf.setImage(
            with: url, placeholder: UIImage(named: "NoPhoto"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        image.kf.indicator?.stopAnimatingView()
    }
}
