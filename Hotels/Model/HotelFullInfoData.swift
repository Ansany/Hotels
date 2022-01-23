//
//  HotelFullInfoData.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

struct HotelFullInfoData: Decodable {
    
    let id: Int?
    let name: String?
    let address: String?
    let stars: Double?
    let distance: Double?
    let suites_availability: String?
    let image: String?
    let lat: Double?
    let lon: Double?
}
