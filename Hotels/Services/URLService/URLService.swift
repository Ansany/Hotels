//
//  URLService.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

struct URLService: URLServiceProtocol {
    
    //MARK: - Private properties
    private let baseURL = "https://raw.githubusercontent.com/iMofas/ios-android-test/master/"
    
    //MARK: - Public methods
    public func getHotelsURL() -> URL? {
        guard let url = URL(string: baseURL + "0777.json") else { return nil }
        return url
    }
    
    public func getHotelURL(withHotelID id: Int) -> URL? {
        guard let url = URL(string: baseURL + String(id) + ".json") else { return nil }
        return url
    }
    
    public func getHotelImageURL(withImageID id: String) -> URL? {
        guard let url = URL(string: baseURL + id) else { return nil }
        return url
    }
}
