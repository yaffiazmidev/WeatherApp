//
//  HomePresenter.swift
//  WeatherApp
//
//  Created by Yaffi Azmi on 16/01/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import Foundation

protocol IHomePresenter {
    func onSuccessGetGeoCoordinates(withRegisterObject: HomeModel.ViewModel)
    func onFailedGetGeoCoordinates(errorMessage: String)
}

class HomePresenter: IHomePresenter {
    weak var viewController: IHomeViewController?
    
    func onFailedGetGeoCoordinates(errorMessage: String) {
        viewController?.showGeoCoordinateError(errorMessage: errorMessage)
    }
    
    func onSuccessGetGeoCoordinates(withRegisterObject: HomeModel.ViewModel) {
        viewController?.showGeoCoordinateWeather(geoCoordinatesModel: withRegisterObject)
    }
}
