//
//  ListInputView.swift
//  HingeInputs
//

import UIKit

final class ListInputView: UIView, ListInputViewConfigurator {
    private var interactor: ListInputViewProviding?

    private var selectedItemsCollectionView: UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10.0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .backgroundColor
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        return collectionView
    }()

    private var listedItemsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 44.0
        tableView.backgroundColor = .backgroundColor
        return tableView
    }()

    init() {
        super.init(frame: .zero)
        setUpView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConfiguration(interactor: ListInputViewProviding) {
        self.interactor = interactor
    }

    private func setUpView() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        addSubview(stackView)
        stackView.addArrangedSubview(selectedItemsCollectionView)
        stackView.addArrangedSubview(listedItemsTableView)
        stackView.addConstraintsToFillView(self)

        NSLayoutConstraint.activate([
            selectedItemsCollectionView.heightAnchor.constraint(equalToConstant: 50.0),
            listedItemsTableView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])

        selectedItemsCollectionView.register(
            ListInputCollectionViewCell.self,
            forCellWithReuseIdentifier: ListInputCollectionViewCell.reuseIdentifier
        )
        selectedItemsCollectionView.dataSource = self
        selectedItemsCollectionView.delegate = self

        listedItemsTableView.register(
            ListInputTableViewCell.self,
            forCellReuseIdentifier:ListInputTableViewCell.reuseIdentifier
        )
        listedItemsTableView.dataSource = self
        listedItemsTableView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource

extension ListInputView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interactor?.selectedItems.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListInputCollectionViewCell.reuseIdentifier, for: indexPath)

        guard let interactor = interactor,
              let listCell = cell as? ListInputCollectionViewCell,
              indexPath.row < interactor.selectedItems.count
        else {
            return cell
        }

        let item = interactor.selectedItems[indexPath.row]
        listCell.label.text = item.title
        return listCell
    }
}

// MARK: - UICollectionViewDelegate

extension ListInputView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let interactor = interactor,
              indexPath.row < interactor.selectedItems.count
        else {
            return
        }

        interactor.onItemDeselected(interactor.selectedItems[indexPath.row]) { [weak self] in
            self?.selectedItemsCollectionView.reloadData()
            self?.listedItemsTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension ListInputView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListInputTableViewCell.reuseIdentifier, for: indexPath)

        guard let interactor = interactor,
              indexPath.row < interactor.items.count,
              let listCell = cell as? ListInputTableViewCell
        else {
            return cell
        }

        let item = interactor.items[indexPath.row]
        listCell.textLabel?.text = item.title
        listCell.isOptionSelected = interactor.selectedItems.contains(item)
        return listCell
    }
}

// MARK: - UITableViewDelegate

extension ListInputView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let interactor = interactor,
              indexPath.row < interactor.items.count
        else {
            return
        }

        guard let listCell = tableView.cellForRow(at: indexPath) as? ListInputTableViewCell else { return }

        guard !listCell.isOptionSelected else {
            interactor.onItemDeselected(interactor.items[indexPath.row]) { [weak self] in
                self?.reloadData()
            }
            return
        }

        interactor.onItemSelected(interactor.items[indexPath.row]) { [weak self] in
            self?.reloadData()
        }
    }

    private func reloadData() {
        selectedItemsCollectionView.reloadData()
        listedItemsTableView.reloadData()
    }
}
