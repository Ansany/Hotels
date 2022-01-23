//
//  HLViewPresenterProtocol.swift
//  Hotels
//
//  Created by Andrey Alymov on 21.01.2022.
//

import Foundation
import UIKit

//MARK: - Input
protocol HLViewPresenterProtocol: AnyObject {
    var hotels: [HotelFullInfoData]? { get set }
    init(view: HLViewProtocol, router: RouterProtocol, networkDataFetcher: ApiNetworkDataFetcherProtocol)
    func getHotels()
    func tapOnHotel()
}
