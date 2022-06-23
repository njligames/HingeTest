//
//  ListInputViewModel.swift
//  HingeInputs
//
//  Created by James Folk on 6/22/22.
//

import UIKit

protocol ListInputViewProviding: AnyObject {
    var pronouns: [Pronoun] { get }
    var selectedPronouns: [Pronoun] { get }
    func onItemSelected(_ pronoun: Pronoun, onCompletion: (() -> Void)?)
    func onItemDeselected(_ pronoun: Pronoun, onCompletion: (() -> Void)?)
}

protocol ConfigurableListInputView: UIView {
    func setConfiguration(interactor: ListInputViewProviding)
}

final class ListInputViewModel: ListInputViewProviding {
    var pronouns: [Pronoun]
    var selectedPronouns: [Pronoun]
    
    init(with pronouns: [Pronoun] = Pronoun.testGroup1) {
        self.pronouns = pronouns
        selectedPronouns = []
    }
    
    func onItemSelected(_ pronoun: Pronoun, onCompletion: (() -> Void)? = nil) {
        guard !selectedPronouns.contains(pronoun) else { return }
        selectedPronouns.append(pronoun)
        onCompletion?()
    }
    
    func onItemDeselected(_ pronoun: Pronoun, onCompletion: (() -> Void)? = nil) {
        selectedPronouns.removeAll { $0 == pronoun }
        onCompletion?()
    }
}
