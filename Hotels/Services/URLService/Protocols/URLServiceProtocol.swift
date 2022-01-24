//
//  URLServiceProtocol.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

protocol URLServiceProtocol {
    func getHotelsURL() -> URL?
    func getHotelURL(withHotelID id: Int) -> URL?
    func getHotelImageURL(withImageID id: String) -> URL?
}
