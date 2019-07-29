//
//  Extansion-ViewController+UITextFieldDelegate.swift
//  WeatherApp2-MVVM-singleView
//
//  Created by Serhii CHORNONOH on 7/29/19.
//  Copyright © 2019 Serhii CHORNONOH. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("return key")
        if textField.text?.isEmpty == false {
            viewModel?.fetchMetadata(request: textField.text!)
            textField.text = ""
            return true
        } else {
            return false
        }
    }

}
