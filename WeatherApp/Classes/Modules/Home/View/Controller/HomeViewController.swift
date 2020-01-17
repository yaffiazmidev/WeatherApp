//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Yaffi Azmi on 15/01/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import UIKit

protocol IHomeViewController: class {
    func showGeoCoordinateWeather(geoCoordinatesModel: HomeModel.ViewModel)
    func showGeoCoordinateError(errorMessage: String)
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var interactor: IHomeInteractor?
    var router: (NSObjectProtocol & IHomeRouter & IHomeDataPassing)?

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.stopAnimating()
        navigationController?.isNavigationBarHidden = true
        getWeather()
    }
    @IBAction func didClickRefreshButton(_ sender: Any) {
        getWeather()
    }
    
    func getWeather() {
        LocationManager.shared.start()
        LocationManager.shared.location = { [weak self] lat, lon in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self?.interactor?.handleGetWeater(
                    model: HomeModel.Request.HomeGetWeaterRequest(
                        lat: lat,
                        lon: lon
                    )
                )
            }
        }
    }
}

extension HomeViewController: IHomeViewController {
    func showGeoCoordinateWeather(geoCoordinatesModel: HomeModel.ViewModel) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        self.cityNameLabel.text = geoCoordinatesModel.name
        self.countryLabel.text = "Country: \(geoCoordinatesModel.sys?.country ?? "")"
        self.tempLabel.text = Conversions.convertTemp(temp: geoCoordinatesModel.main?.temp ?? 0, from: .kelvin, to: .celsius)
        self.tempMinLabel.text = "Min " + Conversions.convertTemp(temp: geoCoordinatesModel.main?.temp_min ?? 0, from: .kelvin, to: .celsius)
        self.tempMaxLabel.text = "Max " + Conversions.convertTemp(temp: geoCoordinatesModel.main?.temp_max ?? 0, from: .kelvin, to: .celsius)

    }
    
    func showGeoCoordinateError(errorMessage: String) {
        print(errorMessage)
    }
}

