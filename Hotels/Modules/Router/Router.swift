//
//  Router.swift
//  Hotels
//
//  Created by Andrey Alymov on 21.01.2022.
//

import UIKit

final class Router: RouterProtocol {
    
    //MARK: - Properties
    var navController: UINavigationController?
    var configurator: ModuleConfigurator?
    
    //MARK: - Inicializator
    init(navController: UINavigationController, configurator: ModuleConfigurator) {
        self.navController = navController
        self.configurator = configurator
    }
    
    //MARK: - Public methods for showing modules
    func showHotelsListLVC() {
        if let navController = navController {
            guard let hotelsListVC = configurator?.configureHLModule(with: self) else { return }
            navController.viewControllers = [hotelsListVC]
        }
    }
    
    func showHotelDetailVC() {
        if let navController = navController {
            guard let hotelDetailVC = configurator?.configureHDModule(with: self) else { return }
            navController.viewControllers = [hotelDetailVC]
        }
    }

}
