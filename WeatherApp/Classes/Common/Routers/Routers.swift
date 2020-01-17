//
//  Routers.swift
//  WeatherApp
//
//  Created by Yaffi Azmi on 17/01/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import Foundation
import UIKit

enum Routers {
    case home
    
    func controller(parameters: [String: Any]? = nil) -> UIViewController {
        switch self {
        case .home:
            let root = HomeViewController()
            let interactor = HomeInteractor()
            let presenter = HomePresenter()
            let router = HomeRouter()
            let manager = HomeManager()
            
            root.interactor = interactor
            root.router = router
            interactor.presenter = presenter
            interactor.paramters = parameters
            interactor.manager = manager
            presenter.viewController = root
            router.view = root
            return root
        }
    }
}
