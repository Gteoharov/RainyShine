//
//  Constants.swift
//  RainyShine
//
//  Created by Georgi Teoharov on 18.05.18.
//  Copyright © 2018 Georgi Teoharov. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let API_ID = "&appid="
let API_KEY = "e93a856cfda88ece497b68d57bf53f72"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)139\(API_ID)\(API_KEY)"



