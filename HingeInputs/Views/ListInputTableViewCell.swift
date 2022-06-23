//
//  ListInputTableViewCell.swift
//  HingeInputs
//
//  Created by James Folk on 6/22/22.
//

import UIKit


final class ListInputTableViewCell: UITableViewCell {

    private enum Constants {
        static let circleViewDiameter: CGFloat = 15.0
    }

    static let reuseIdentifier = "ListInputTableViewCell"

    private let circleView = UIView(
        frame: .init(
            origin: .zero,
            size: .init(width: Constants.circleViewDiameter, height: Constants.circleViewDiameter)
        )
    )

    var isOptionSelected: Bool {
        set {
            circleView.backgroundColor = newValue ? .circleOn : .circleOff
        }
        get { circleView.backgroundColor == .circleOn }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    private func setUp() {
        selectionStyle = UITableViewCell.SelectionStyle.none
        backgroundColor = .backgroundColor
        textLabel?.textColor = .textColor2

        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.layer.cornerRadius = circleView.frame.height / 2.0
        contentView.addSubview(circleView)

        NSLayoutConstraint.activate([
            circleView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            circleView.widthAnchor.constraint(equalToConstant: Constants.circleViewDiameter),
            circleView.heightAnchor.constraint(equalToConstant: Constants.circleViewDiameter)
        ])
    }

}

