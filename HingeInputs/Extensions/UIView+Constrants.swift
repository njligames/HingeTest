//
//  UIView+Constrants.swift
//  HingeInputs
//
//  Created by James Folk on 6/22/22.
//

import UIKit

extension UIView {

    func addConstraintsToFillView(_ view: UIView) {
        NSLayoutConstraint.activate([
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


    func addConstraintsToSafelyFillView(_ view: UIView, with insets: UIEdgeInsets = .zero) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -insets.right),
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -insets.bottom)
        ])
    }

}
