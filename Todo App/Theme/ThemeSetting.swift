//
//  ThemeSetting.swift
//  Todo App
//
//  Created by Abdul Halim on 24/02/21.
//  Copyright © 2021 NEONFACT. All rights reserved.
//

import SwiftUI

class ThemeSettings: ObservableObject {
    @Published var themeSettings : Int = UserDefaults.standard.integer(forKey: "Theme"){
        didSet{
            UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
        }
    }
    
    private init() {}
    public static let shared = ThemeSettings()
}
