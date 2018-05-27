//
//  Forecast.swift
//  RainyShine
//
//  Created by Georgi Teoharov on 22.05.18.
//  Copyright © 2018 Georgi Teoharov. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    var _timeHours: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    var timeHours: String {
        if _timeHours == nil {
            _timeHours = ""
        }
        return _timeHours
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["main"] as? Dictionary<String, AnyObject> {
            if let min = temp["temp_min"] as? Double {
                let kelvinToCelsiumPreDivision = min - 273.15
                let kelvinToCelsium = Double(round(10 * kelvinToCelsiumPreDivision / 10))
                self._lowTemp = String(kelvinToCelsium)
            }
            
            if let max = temp["temp_max"] as? Double {
                let kelvinToCelsiumPreDivision = max - 273.15
                let kelvinToCelsium = Double(round(10 * kelvinToCelsiumPreDivision / 10))
                self._highTemp = String(kelvinToCelsium)
            }
         }
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConverterDate = Date(timeIntervalSince1970: date)
            let dateFromatter = DateFormatter()
            dateFromatter.dateStyle = .full
            dateFromatter.dateFormat = "EEEE"
            dateFromatter.dateStyle = .none
            self._date = unixConverterDate.dayOfTheWeek()
            
        }
        
        if let dateTime = weatherDict["dt_txt"] as? String {
            let main = dateTime.components(separatedBy: " ")
            let splitTime = main[1]
            self._timeHours = splitTime
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE"
        return dateFormater.string(from: self)
    }
    func timeHours() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "HH"
        return dateFormater.string(from: self)
    }
}
