//
//  MovSubtitleLabel.swift
//  Movies
//
//  Created by DenizCagilligecit on 21.08.2020.
//  Copyright © 2020 garage. All rights reserved.
//



import UIKit

class MovSubtitleLabel: UILabel {
  

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 15, weight: .light)
        lineBreakMode = .byTruncatingTail
        textColor = .label
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontForContentSizeCategory = false
        }

}
