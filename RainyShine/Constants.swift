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
let API_KEY = "8e47a3c1e4f570c1870e5b6e8b16e24c"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(LONGITUDE)\(API_ID)\(API_KEY)"



