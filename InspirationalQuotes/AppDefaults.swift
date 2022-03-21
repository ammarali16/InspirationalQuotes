//
//  AppDefaults.swift
//  InspirationalQuotes
//
//  Created by Admin on 11/27/18.
//  Copyright © 2018 Mujadidia Inc. All rights reserved.
//

import Foundation

class AppDefaults: NSObject {
    
    public static let defaults = UserDefaults.standard
    
    
    public static var isAppStartingFirstTime: Bool {
        get{
            return defaults.bool(forKey: "isAppStartingFirstTime")
        }
        set{
            defaults.set(newValue, forKey: "isAppStartingFirstTime")
            defaults.synchronize()
        }
    }
}

