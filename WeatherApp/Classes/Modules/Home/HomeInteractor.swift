//
//  HomeInteractor.swift
//  WeatherApp
//
//  Created by Yaffi Azmi on 16/01/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol IHomeInteractor {
    var paramters: [String: Any]? { get }

    func handleGetWeater(model: HomeModel.Request.HomeGetWeaterRequest)
}

class HomeInteractor: IHomeInteractor {
    var paramters: [String: Any]?
    var presenter: IHomePresenter?
    var manager: IHomeManager?

    func handleGetWeater(model: HomeModel.Request.HomeGetWeaterRequest) {
        manager?.processGetData(model: model, completion: { result in
            switch result {
            case .failure(let error):
                self.presenter?.onFailedGetGeoCoordinates(errorMessage: error.localizedDescription)
            case .success(let data):
                print(data)
                let newGeo = HomeModel.ViewModel(json: JSON(data))
                self.presenter?.onSuccessGetGeoCoordinates(withRegisterObject: newGeo)
            }
        })
    }
}
