//
//  NetworkError.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

enum NetworError: Error {
    case noHTTPResponse
    case noDataReceived
    case unacceptableStatusCode
}
