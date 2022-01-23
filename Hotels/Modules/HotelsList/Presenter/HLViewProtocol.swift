//
//  HLViewProtocol.swift
//  Hotels
//
//  Created by Andrey Alymov on 21.01.2022.
//

import Foundation

//MARK: - Output
protocol HLViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}
