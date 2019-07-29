//
//  Extension-ViewController.swift
//  WeatherApp2-MVVM-singleView
//
//  Created by Serhii CHORNONOH on 7/29/19.
//  Copyright © 2019 Serhii CHORNONOH. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        for label in weatherLabels {
            label.textColor = .white
        }
        textField.layer.borderColor = UIColor(red:0.81, green:0.81, blue:0.81, alpha:1.0).cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1.0
        textField.attributedPlaceholder = NSAttributedString(string: "Weather in ?", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red:0.81, green:0.81, blue:0.81, alpha:1.0)])
        
        backgroundView.layer.addSublayer(gradientLayer)
        setBlueGradientBackground()
    }
    
    func setBlueGradientBackground() {
        let topColor = UIColor(red: 95.0/255.0, green: 165.0/255.0, blue: 1.0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 72.0/255.0, green: 114.0/255.0, blue: 184.0/255.0, alpha: 1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor, bottomColor]
    }
    
    func setGreyGradientBackground(){
        let topColor = UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor, bottomColor]
    }
    
}
