//
//  ViewController+Ext.swift
//  Movies
//
//  Created by DenizCagilligecit on 15.08.2020.
//  Copyright © 2020 garage. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    func presentMovAlertOnTheMainThread(title: String,message: String,buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = MovAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
