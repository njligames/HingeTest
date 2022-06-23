//
//  ViewController.swift
//  HingeInputs
//

import UIKit

class ViewController: UIViewController {
    
    private let myInputView: ConfigurableListInputView = {
        let view = ListInputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundColor
        return view
    }()

    private let mySwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()

    private func setUp() {
        view.backgroundColor = .backgroundColor

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 24.0
        stackView.backgroundColor = .backgroundColor
        view.addSubview(stackView)

        stackView.addArrangedSubview(myInputView)
        stackView.addArrangedSubview(mySwitch)

        stackView.addConstraintsToSafelyFillView(
            view,
            with: .init(top: 48.0, left: 1.0, bottom: 12.0, right: 12.0)
        )

        NSLayoutConstraint.activate([
            mySwitch.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myInputView.setConfiguration(interactor: ListInputViewModel())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}
