//
//  NetworkService.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

struct NetworkService: NetworkServiceProtocol {
    
    //MARK: - Public methods
    public func request(url: URL, completion: @escaping (Result<Data?, Error>) -> Void) {
        let task = createDataTask(from: url, completion: completion)
        task.resume()
    }
    
    //MARK: - Private methods
    private func createDataTask(from url: URL, completion: @escaping (Result<Data?, Error>) -> Void) -> URLSessionDataTask {
        let request = URLRequest(url: url)
        return URLSession.shared.dataTask(with: request) { data, respone, error in
            
            // failures
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            guard let response = respone as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(.failure(NetworError.noHTTPResponse))
                }
                return
            }
            guard response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(NetworError.unacceptableStatusCode))
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NetworError.noDataReceived))
                }
                return
            }
            // success
            let cache = URLCache.shared
            if let data = cache.cachedResponse(for: request)?.data {
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } else {
                let cachedData = CachedURLResponse(response: response, data: data)
                cache.storeCachedResponse(cachedData, for: request)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            }
        }
    }
}
