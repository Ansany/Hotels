//
//  UIAlertController+Error.swift
//  Hotels
//
//  Created by Andrey Alymov on 23.01.2022.
//

import UIKit

//MARK: - Extention for alert, for errors handling
extension UIAlertController {
    
    static func appErrorAlert(controllerTitlte: String?, controllerMessage: String?, actionTitle: String?, cancelTitlte: String?, actionHandler: ((UIAlertAction) -> Void)? = nil, cancelHandler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        
        let alertController = UIAlertController(title: controllerTitlte, message: controllerMessage, preferredStyle: .alert)
        let reloadAction = UIAlertAction(title: actionTitle, style: .default, handler: actionHandler)
        let cancelAction = UIAlertAction(title: cancelTitlte, style: .destructive, handler: cancelHandler)
        
        alertController.addAction(reloadAction)
        alertController.addAction(cancelAction)
        
        return alertController
    }
}
