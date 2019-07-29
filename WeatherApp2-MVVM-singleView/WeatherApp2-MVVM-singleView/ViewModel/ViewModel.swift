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
    var flag : Box<Bool> = Box(false)
    var status : Box<Status> = Box(Status.first)
    
    func fetchMetadata(request: String) {
        networkManager.fetchMetadata(request: request, viewModel: self)
    }
}


