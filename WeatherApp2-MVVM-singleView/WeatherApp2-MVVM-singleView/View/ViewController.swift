//
//  ViewController.swift
//  WeatherApp2-MVVM-singleView
//
//  Created by Serhii CHORNONOH on 7/29/19.
//  Copyright © 2019 Serhii CHORNONOH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var weatherLabels: [UILabel]!
    
    @IBOutlet weak var weatherImagView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var viewModel : ViewModel?
    
    @IBOutlet weak var backgroundView: UIView!
    let gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField.delegate = self
        viewModel = ViewModel()
        
        //viewModel?.metadata.bind { self.weatherLabels![0].text = $0.locationName }
        viewModel?.networkManager.metadata.bind {
            self.weatherLabels![0].text = $0.locationName
            self.weatherLabels![1].text = $0.temperature
            self.weatherLabels![2].text = $0.atmosphericPressure
            self.weatherLabels![3].text = $0.humidity
            self.weatherLabels![4].text = $0.windSpeed
            self.weatherLabels![5].text = $0.windDirection
            if $0.weatherImageName != "" {
                self.weatherImagView.image = UIImage(named: $0.weatherImageName)
            }
        }
    }


}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("return key")
        if textField.text?.isEmpty == false {
//            viewModel?.request = textField.text!
            viewModel?.fetchMetadata(request: textField.text!)
            textField.text = ""
            return true
        } else {
            return false
        }
        
    }
    
}
