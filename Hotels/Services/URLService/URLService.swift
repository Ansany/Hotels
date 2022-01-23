//
//  URLService.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

//MARK: - Create URL from queryItems
struct URLService: URLServiceProtocol {
    
    public func fetchURLWithComponents(from urlString: String, components: [URLQueryItem]) -> URL? {
        guard var urlComponents = URLComponents(string: urlString) else { return nil }
        urlComponents.queryItems = components
        guard let url = urlComponents.url else { return nil }
        return url
    }
}

