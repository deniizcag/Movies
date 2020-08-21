//
//  ErrorTitleLabel.swift
//  Movies
//
//  Created by DenizCagilligecit on 15.08.2020.
//  Copyright © 2020 garage. All rights reserved.
//

import UIKit

class MovTitleLabel: UILabel {
  

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(fontSize: CGFloat,alignment: NSTextAlignment) {
        
        self.init(frame: .zero)
        self.textAlignment = alignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)

    }
    convenience init(fontSize: CGFloat,alignment: NSTextAlignment,weight:UIFont.Weight) {
           
           self.init(frame: .zero)
           self.textAlignment = alignment
           self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        lineBreakMode = .byTruncatingTail
        textColor = .label
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontForContentSizeCategory = false
        }

}
