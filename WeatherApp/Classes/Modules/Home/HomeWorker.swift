//
//  HomeWorker.swift
//  WeatherApp
//
//  Created by Yaffi Azmi on 16/01/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol IHomeManager: class {
    func processGetData(model: HomeModel.Request.HomeGetWeaterRequest, completion: @escaping (Swift.Result<JSON, NetworkError>) -> Void)
}

class HomeManager: IHomeManager {
    private var api = APIService.share
    
    func processGetData(model: HomeModel.Request.HomeGetWeaterRequest, completion: @escaping (Result<JSON, NetworkError>) -> Void) {
        api.request(endpoint: GeneralEndpoint.getWeater(model: model), completion: completion)
    }
}
