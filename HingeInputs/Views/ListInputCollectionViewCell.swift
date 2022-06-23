//
//  ListInputCollectionViewCell.swift
//  HingeInputs
//
//  Created by James Folk on 6/22/22.
//

import UIKit


final class ListInputCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "ListInputCollectionViewCell"

    private enum Constants {
        static let height: CGFloat = 38.0
        static let paddingWidth: CGFloat = 50.0
    }

    private static let font = UIFont.systemFont(ofSize: 16, weight: .regular)

    private(set) var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textColor1
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    private func setUp() {
        contentView.layer.masksToBounds = true

        let view = UIView()
        contentView.addSubview(view)

        view.backgroundColor = .collectionCellColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraintsToFillView(contentView)
        view.addSubview(label)
        
        label.font = Self.font
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: (Constants.height / 2) - 10.0)
        ])
        
        let closeIcon = UIImageView(image: UIImage(named: "closeIcon"))
        closeIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeIcon)
        
        NSLayoutConstraint.activate([
            closeIcon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0),
            closeIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: (Constants.height / 2) - (closeIcon.frame.height / 2))
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = contentView.bounds.height / 2.0
    }

    override func preferredLayoutAttributesFitting(
        _ layoutAttributes: UICollectionViewLayoutAttributes
    ) -> UICollectionViewLayoutAttributes {
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        attributes.size = Self.preferredSize(for: label.text ?? "")
        frame = .init(origin: frame.origin, size: attributes.size)
        setNeedsLayout()
        layoutIfNeeded()
        return attributes
    }

    private static func preferredSize(for text: String) -> CGSize {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: Constants.height)
        let boundingBox = text.boundingRect(with: constraintRect,
                                            options: [.usesLineFragmentOrigin,
                                                      .usesFontLeading],
                                            context: nil)
        
        return CGSize(width: Constants.paddingWidth + boundingBox.width,
                      height: Constants.height)
    }

}


