//
//  ApiURLServiceProtocol.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

protocol ApiURLServiceProtocol {
    init(urlService: URLServiceProtocol)
    func getHotelsURL() -> URL?
}
