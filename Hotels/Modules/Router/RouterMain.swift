//
//  RouterMain.swift
//  Hotels
//
//  Created by Andrey Alymov on 21.01.2022.
//

import UIKit

protocol RouterMain {
    var navController: UINavigationController? { get set }
    var configurator: ModuleConfigurator? { get set }
    init(navController: UINavigationController, configurator: ModuleConfigurator)
}
