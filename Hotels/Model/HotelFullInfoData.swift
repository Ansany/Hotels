//
//  HotelFullInfoData.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

struct HotelFullInfoData: Codable {
    
    let id: Int?
    let name: String?
    let fullInfo: FullInfo

}

struct FullInfo: Codable {
    
    let address: String?
    let description: String?
    let stars: Int?
    let distance: Double?
    let suitesAvailability: Int?
    let firstImage: String?
    let images: [String]?
    let lat: Double?
    let lon: Double?
    
}
