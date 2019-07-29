//
//  ViewModel.swift
//  WeatherApp2-MVVM-singleView
//
//  Created by Serhii CHORNONOH on 7/29/19.
//  Copyright © 2019 Serhii CHORNONOH. All rights reserved.
//

import Foundation

class ViewModel {
    
    var networkManager = NetworkManager()
    
    var metadata : Box<WeatherMetadata> = Box(WeatherMetadata())
    
    func fetchMetadata(request: String) {
        networkManager.fetchMetadata(request: request, viewModel: self)
    }
}
