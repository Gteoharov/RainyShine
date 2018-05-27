//
//  Location.swift
//  RainyShine
//
//  Created by Georgi Teoharov on 27.05.18.
//  Copyright © 2018 Georgi Teoharov. All rights reserved.
//

import CoreLocation


class Location {
    static var shareInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
