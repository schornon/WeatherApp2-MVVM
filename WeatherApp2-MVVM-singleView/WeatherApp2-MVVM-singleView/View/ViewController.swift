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
    @IBOutlet var weatherImageLabels: [UIImageView]!
    @IBOutlet weak var weatherImagView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    let gradientLayer = CAGradientLayer()
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var viewModel : ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField.delegate = self
        viewModel = ViewModel()
        
        setBinding()
    }
    
    func setBinding() {
        
        viewModel?.metadata.bind {
            self.weatherLabels![0].text = $0.locationName
            self.weatherLabels![1].text = $0.temperature
            self.weatherLabels![2].text = $0.atmosphericPressure
            self.weatherLabels![3].text = $0.humidity
            self.weatherLabels![4].text = $0.windSpeed
            self.weatherLabels![5].text = $0.windDirection
            if $0.weatherImageName != "" {
                self.weatherImagView.image = UIImage(named: $0.weatherImageName)
                switch $0.weatherImageName.suffix(1) {
                case "n":
                    self.setGreyGradientBackground()
                default:
                    self.setBlueGradientBackground()
                }
            }
        }
        
        viewModel?.status.bind {
            switch $0 {
            case .done:
                self.activityView.alpha = 0
                self.activityView.stopAnimating()
            case .failure:
                self.activityView.alpha = 0
                self.activityView.stopAnimating()
                self.errorAlert(title: "Error", message: "Can't find this location")
            case .loading:
                self.activityView.alpha = 1
                self.activityView.startAnimating()
            case .first:
                print("first load")
            }
        }
        
        viewModel?.flag.bind {
            if $0 == true {
                for imgView in self.weatherImageLabels {
                    imgView.alpha = 1.0
                }
            }
        }
    }

}
