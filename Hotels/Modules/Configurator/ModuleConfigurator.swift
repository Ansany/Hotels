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
        
        return view
    }
    
}
