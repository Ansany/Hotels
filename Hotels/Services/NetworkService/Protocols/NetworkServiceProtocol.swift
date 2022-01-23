//
//  NetworkServiceProtocol.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func request(url: URL, completion: @escaping (Result<Data?, Error>) -> Void)
}
