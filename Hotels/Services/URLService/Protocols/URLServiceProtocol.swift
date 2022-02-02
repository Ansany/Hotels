//
//  URLServiceProtocol.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

protocol URLServiceProtocol {
    func getHotelsURL() -> URL?
    func getHotelImageURL(withHotelID hotelID: Int, imgID imageID: String) -> URL?
}
