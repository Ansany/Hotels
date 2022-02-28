//
//  ModuleConfigurator.swift
//  Hotels
//
//  Created by Andrey Alymov on 21.01.2022.
//

import UIKit

final class ModuleConfigurator {
    
    //MARK: - Configure HotelsList module
    func configureHLModule(with router: RouterProtocol) -> UIViewController {
        let view = HotelsListViewController()
        let networkDataFetcher = ApiNetworkDataFetcher()
        let presenter = HLPresenter(view: view, router: router, networkDataFetcher: networkDataFetcher)
        view.presenter = presenter
        
        return view
    }
    
    //MARK: - Configure HotelDetail module
    func configureHDModule(with router: RouterProtocol) -> UIViewController {
        let view = HotelDetailViewController()
        let networkDataFetcher = ApiNetworkDataFetcher()
        
        return view
    }
    
}
