//
//  UIView+Ext.swift
//  Movies
//
//  Created by DenizCagilligecit on 17.08.2020.
//  Copyright © 2020 garage. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...)
    {
        for view in views {
            addSubview(view)
            
        }
        
    }
    func pinToEdges(of superView: UIView) {
          translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
              bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor),
              leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor),
              trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor),
              
          ])
      }
}
