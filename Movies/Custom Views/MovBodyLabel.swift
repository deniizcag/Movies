//
//  MovBodyLabel.swift
//  Movies
//
//  Created by DenizCagilligecit on 15.08.2020.
//  Copyright © 2020 garage. All rights reserved.
//

import UIKit

class MovBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    convenience init(textAlignment: NSTextAlignment){
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        lineBreakMode = .byTruncatingTail
        numberOfLines = 2
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontForContentSizeCategory = true

    }
}
