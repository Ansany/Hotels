//
//  URLService.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

struct URLService: URLServiceProtocol {
    
    //MARK: - Private properties
    private let baseURL = "https://raw.githubusercontent.com/Ansany/JsonDB/main/Hotels/"
    
    //MARK: - Public methods
    public func getHotelsURL() -> URL? {
        guard let url = URL(string: baseURL + "SaintPetersburgHotels.json") else { return nil }
        return url
    }
    
    public func getHotelImageURL(withHotelID hotelID: Int, imgID imageID: String) -> URL? {
        guard let url = URL(string: baseURL + "/\(hotelID)/\(imageID).jpg") else { return nil }
        return url
    }
}
