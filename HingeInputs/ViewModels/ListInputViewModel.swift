//
//  ListInputViewModel.swift
//  HingeInputs
//
//  Created by James Folk on 6/22/22.
//

import UIKit

typealias ItemType = Pronoun

protocol ListInputViewProviding: AnyObject {
    var items: [ItemType] { get }
    var selectedItems: [ItemType] { get }
    func onItemSelected(_ item: ItemType, onCompletion: (() -> Void)?)
    func onItemDeselected(_ item: ItemType, onCompletion: (() -> Void)?)
}

protocol ListInputViewConfigurator: UIView {
    func setConfiguration(interactor: ListInputViewProviding)
}

final class ListInputViewModel: ListInputViewProviding {
    var items: [ItemType]
    var selectedItems: [ItemType]
    
    init(with items: [ItemType] = ItemType.testGroup1) {
        self.items = items
        selectedItems = []
    }
    
    func onItemSelected(_ item: ItemType, onCompletion: (() -> Void)? = nil) {
        guard !selectedItems.contains(item) else { return }
        selectedItems.append(item)
        onCompletion?()
    }
    
    func onItemDeselected(_ item: ItemType, onCompletion: (() -> Void)? = nil) {
        selectedItems.removeAll { $0 == item }
        onCompletion?()
    }
}
