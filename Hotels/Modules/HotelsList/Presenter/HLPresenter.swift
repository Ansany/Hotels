//
//  HLPresenter.swift
//  Hotels
//
//  Created by Andrey Alymov on 21.01.2022.
//

import Foundation

final class HLPresenter: HLViewPresenterProtocol {    
    
    //MARK: - Public properties
    weak var view: HLViewProtocol? //output
    var router: RouterProtocol?
    var networkDataFetcher: ApiNetworkDataFetcherProtocol?
    var hotels: [HotelFullInfoData]?
    
    //MARK: - Inicializer
    required init(view: HLViewProtocol, router: RouterProtocol, networkDataFetcher: ApiNetworkDataFetcherProtocol) {
        self.view = view
        self.router = router
        self.networkDataFetcher = networkDataFetcher
        getHotels()
    }
    
    //MARK: - Public methods
    // Fetching hotels (json) from the internet
    public func getHotels() {
        networkDataFetcher?.fetchHotels { [ weak self ] result in
            guard let self = self else { return }
            switch result {
            case .success(let hotels):
                self.hotels = hotels
                self.view?.success()
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
    }
    
    //MARK: - User's actions
    func tapOnHotel() {
        print("Hotel ->")
    }
}
