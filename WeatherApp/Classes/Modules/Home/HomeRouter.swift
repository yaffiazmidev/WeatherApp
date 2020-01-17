//
//  HomeRouter.swift
//  WeatherApp
//
//  Created by Yaffi Azmi on 16/01/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import Foundation

protocol IHomeDataPassing {
    
}

@objc protocol IHomeRouter: class {
    
}

class HomeRouter: NSObject, IHomeRouter, IHomeDataPassing {
    weak var view: HomeViewController?
}
