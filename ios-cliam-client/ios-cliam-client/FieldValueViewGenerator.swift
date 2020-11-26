//
//  FieldValueViewGenerator.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 10/27/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class FieldValueViewGenerator {
    var lblName : String!
    
    init(n : String) {
        lblName = n
    }
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        //
        let lbl = UILabel()
        lbl.text = lblName
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        
        let val = UITextField()
        val.borderStyle = .roundedRect
        stackView.addArrangedSubview(val)
        
        //
        lbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        val.setContentHuggingPriority(.defaultLow, for: .horizontal)
        lbl.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        val.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        //
        return stackView
    }
}
