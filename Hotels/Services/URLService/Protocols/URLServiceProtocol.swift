//
//  URLServiceProtocol.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

protocol URLServiceProtocol {
    func fetchURLWithComponents( from url: String, components: [URLQueryItem]) -> URL?
}
