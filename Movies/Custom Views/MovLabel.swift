//
//  MovLabel.swift
//  Movies
//
//  Created by DenizCagilligecit on 6.08.2020.
//  Copyright © 2020 garage. All rights reserved.
//

import UIKit

class MovLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        font = UIFont.preferredFont(forTextStyle: .title1)
        font = UIFont.systemFont(ofSize: 17)
        textColor = .label
        textAlignment = .center
        lineBreakMode = .byWordWrapping

    }
    
}
