//
//  ListInputView.swift
//  HingeInputs
//

import UIKit

class ListInputView: UIView {
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .blue
        self.addConstraint(self.heightAnchor.constraint(equalToConstant: 100.0))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
