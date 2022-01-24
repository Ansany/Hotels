//
//  NetworkDataFetcherProtocol.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import UIKit

protocol NetworkDataFetcherProtocol {
    init(networkService: NetworkServiceProtocol)
    func fetchData(from url: URL, completion: @escaping (Result<Data?, Error>) -> Void)
    func fetchDecodedData <T: Decodable> (from url: URL, completion: @escaping (Result<T?, Error>) -> Void)
    func fetchImage(withURL url: URL, image: UIImageView) -> Void
}
