//
//  GeneralEndpoint.swift
//  WeatherApp
//
//  Created by Yaffi Azmi on 17/01/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import Foundation
import Alamofire

enum GeneralEndpoint {
    case getWeater(model: HomeModel.Request.HomeGetWeaterRequest)
}

extension GeneralEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .getWeater:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getWeater:
            return "https://api.openweathermap.org/data/2.5/weather"
        }
    }

    var parameter: Parameters? {
        switch self {
        case .getWeater(let model):
            return model.paramters()
        }
    }

    var header: HTTPHeaders? {
        switch self {
        case .getWeater:
            return [
                "Content-Type": "application/json",
            ]
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .getWeater:
            return URLEncoding.queryString
        }
    }
}
