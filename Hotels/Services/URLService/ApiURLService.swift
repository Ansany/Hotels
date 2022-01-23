//
//  ApiURLService.swift
//  Hotels
//
//  Created by Andrey Alymov on 22.01.2022.
//

import Foundation

struct ApiURLService: ApiURLServiceProtocol {
    
    //MARK: - Private properties
    private let baseURL = "https://raw.githubusercontent.com/iMofas/ios-android-test/master/"
    private var urlService: URLServiceProtocol
    
    //MARK: - Initializator
    init(urlService: URLServiceProtocol = URLService()) {
        self.urlService = urlService
    }
    
    //MARK: - Public methods
    func getHotelsURL() -> URL? {
        guard let url = URL(string: baseURL + "0777.json") else { return nil }
        return url
    }
    
}
