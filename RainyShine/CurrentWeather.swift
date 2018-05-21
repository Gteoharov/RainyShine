//
//  CurrentWeather.swift
//  RainyShine
//
//  Created by Georgi Teoharov on 18.05.18.
//  Copyright © 2018 Georgi Teoharov. All rights reserved.
//

import Foundation
import Alamofire


class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentWeather: Double!
    
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentWeather: Double {
        if _currentWeather == nil {
            _currentWeather = 0.0
        }
        return _currentWeather
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        // Alomafire download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        let kelvinToCelsiumPreDivision = currentTemperature - 273.15
                        let kelvinToCelsium = Double(round(10 * kelvinToCelsiumPreDivision / 10))
                        self._currentWeather = kelvinToCelsium
                        print(self._currentWeather)
                    }
                }
                
            }
        }
        completed()
    }
}
