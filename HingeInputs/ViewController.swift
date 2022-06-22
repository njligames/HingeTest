//
//  ViewController.swift
//  HingeInputs
//

import UIKit

class ViewController: UIViewController {
    
    private let myInputView = ListInputView()
    private let mySwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.myInputView.translatesAutoresizingMaskIntoConstraints = false
        self.mySwitch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.myInputView)
        self.view.addSubview(self.mySwitch)
        
        let inputViewConstraints = [
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.myInputView.topAnchor, constant: -48.0),
            self.view.leadingAnchor.constraint(equalTo: self.myInputView.leadingAnchor, constant: -24.0),
            self.view.trailingAnchor.constraint(equalTo: self.myInputView.trailingAnchor, constant: 24.0)
        ]
        let switchConstraints = [
            self.mySwitch.widthAnchor.constraint(equalToConstant: 100.0),
            self.mySwitch.topAnchor.constraint(equalTo: self.myInputView.bottomAnchor, constant: 24.0),
            self.mySwitch.leadingAnchor.constraint(equalTo: self.myInputView.leadingAnchor),
            self.view.safeAreaLayoutGuide.bottomAnchor.constraint(greaterThanOrEqualTo: self.mySwitch.bottomAnchor)
        ]
        self.view.addConstraints(inputViewConstraints)
        self.view.addConstraints(switchConstraints)
    }
}
