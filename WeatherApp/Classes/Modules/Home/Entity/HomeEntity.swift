//
//  HomeEntity.swift
//  WeatherApp
//
//  Created by Yaffi Azmi on 16/01/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import Foundation
import SwiftyJSON

struct HomeModel {
    struct Request {
        struct HomeGetWeaterRequest {
            var city: String?
            var lat: Double = 0.0
            var lon: Double = 0.0
            
            init(city: String? = nil, lat: Double, lon: Double) {
                self.city = city
                self.lat = lat
                self.lon = lon
            }
            
            func paramters() -> [String: Any]? {
                var params: [String: Any] = [:]
                params["appid"] = Env.appId
                
                if let value = self.city {
                    params["q"] = value
                }
                            
                params["lat"] = lat
                params["lon"] = lon
                return params
            }
        }
    }
    
    struct ViewModel {
        var id: Int?
        var name: String?
        var cod: Int?
        var timezone: Int?
        var dt: Int?
        var base: String?
        var visibility: Int?
        var wind: Wind?
        var weather: [Weather]?
        var clouds: Clouds?
        var main: Main?
        var sys: Sys?
        var coord: Coord?
        
        init(json: JSON?) {
            self.id = json?["id"].int
            self.name = json?["name"].string
            self.cod = json?["cod"].int
            self.timezone = json?["timezone"].int
            self.dt = json?["dt"].int
            self.base = json?["base"].string
            self.visibility = json?["visibility"].int
            
            if let value = json?["wind"].dictionaryObject {
                let new = Wind(json: JSON(value))
                self.wind = new
            }
            
            if let value = json?["weather"].dictionaryObject {
                let new = Weather(json: JSON(value))
                self.weather?.append(new)
            }
            
            if let value = json?["clouds"].dictionaryObject {
                let new = Clouds(json: JSON(value))
                self.clouds = new
            }
            
            if let value = json?["main"].dictionaryObject {
                let new = Main(json: JSON(value))
                self.main = new
            }
            
            if let value = json?["sys"].dictionaryObject {
                let new = Sys(json: JSON(value))
                self.sys = new
            }
            
            if let value = json?["coord"].dictionaryObject {
                let new = Coord(json: JSON(value))
                self.coord = new
            }
        }
        
        class Sys {
            var type: Int?
            var id: Int?
            var sunrise: Int?
            var sunset: Int?
            var country: String?
            
            init(json: JSON?) {
                self.type = json?["type"].int
                self.id = json?["id"].int
                self.sunrise = json?["sunrise"].int
                self.sunset = json?["sunset"].int
                self.country = json?["country"].string
            }
        }
        
        struct Coord {
            var lat: Double?
            var lon: Double?
            
            init(json: JSON?) {
                self.lat = json?["lat"].double
                self.lon = json?["lon"].double
            }
        }
        
        struct Clouds {
            var lat: Double?
            var lon: Double?

            init(json: JSON?) {
                self.lat = json?["lat"].double
                self.lon = json?["lon"].double
            }
        }
        
        struct Main {
            var temp: Double?
            var temp_min: Double?
            var temp_max: Double?
            var feels_like: Double?
            var pressure: Int?
            var humidity: Int?
            
            init(json: JSON?) {
                self.temp = json?["temp"].double
                self.temp_min = json?["temp_min"].double
                self.temp_max = json?["temp_max"].double
                self.feels_like = json?["feels_like"].double
                self.pressure = json?["pressure"].int
                self.humidity = json?["humidity"].int
            }
        }
        
        struct Weather {
            var id: Int?
            var main: String?
            var description: String?
            var icon: String?
            
            init(json: JSON?) {
                self.id = json?["id"].int
                self.main = json?["main"].string
                self.description = json?["description"].string
                self.icon = json?["icon"].string
            }
        }
        
        struct Wind {
            var deg: Int?
            var speed: Double?
            
            init(json: JSON?) {
                self.deg = json?["deg"].int
                self.speed = json?["speed"].double
            }

        }
    }
}
