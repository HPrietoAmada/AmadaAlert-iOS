//
//  SelectGroupViewController.swift
//  AmadaAlert
//
//  Created by IT Support on 12/16/18.
//  Copyright © 2018 IT Support. All rights reserved.
//

import UIKit

protocol SelectGroupViewControllerDelegate {
    func done(_ selectGroupViewController: SelectGroupViewController, group: [WebITUsersOffices])
}

class SelectGroupViewController: UIViewController {

    let HEADER_CELL_ID = "HEADER"
    let CHECKBOX_CELL_ID = "CHECKBOX"
    let BLANK_CELL_ID = "BLANK"

    var delegate: SelectGroupViewControllerDelegate?

    var GROUPS: [WebITUsersOffices] = [WebITUsersOffices]()

    var SELECTED_GROUP_STATUS: [Bool] = [Bool]()

    let collectionView: CollectionView = {
        return CollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    }()

    lazy var closeNavigationItem: CloseNavbarButtonItem = {
        let closeNavbarButtonItem = CloseNavbarButtonItem()
        closeNavbarButtonItem.action = #selector(close)
        closeNavbarButtonItem.target = self
        return closeNavbarButtonItem
    }()

    lazy var button: Button = {
        let button = Button()
        button.title = "Done"
        button.width = 90
        button.height = 50
        button.fontSize = 18
        button.addTarget(self, action: #selector(done), for: .touchUpInside)
        return button
    }()

    @objc func done() {
        guard let delegate = delegate else {
            return
        }
        var selectedGroup = [WebITUsersOffices]()
        for (index, group) in GROUPS.enumerated() {
            if SELECTED_GROUP_STATUS[index] == true {
                selectedGroup.append(group)
            }
        }
        delegate.done(self, group: selectedGroup)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CoreDataManager.shared.getWebITUsersOffices { (models, error) in
            if let _ = error {
                self.getUsersOfficesFromDB()
                return
            }
            guard let models = models else {
                self.getUsersOfficesFromDB()
                return
            }

            self.GROUPS = models
            self.reloadData()

        }
    }

    private func getUsersOfficesFromDB() {
        DBManager.shared.getUsersOffices { (model, error, message) in
            if let error = error {
                print("Offices Error: \(error.localizedDescription)")
                return
            }

            guard let groups = model else {
                return
            }

            self.GROUPS = groups
            self.reloadData()
        }
    }

    private func reloadData() {
        SELECTED_GROUP_STATUS = [Bool](repeating: false, count: GROUPS.count)
        collectionView.reloadData()
    }

    private func setup() {
        view.backgroundColor = .white

        view.addSubview(collectionView)
        view.addSubview(button)

        navigationItem.leftBarButtonItem = closeNavigationItem

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        collectionView.register(TitleCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HEADER_CELL_ID)
        collectionView.register(CheckboxCollectionCell.self, forCellWithReuseIdentifier: CHECKBOX_CELL_ID)
        collectionView.register(BlankCollectionReuseCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BLANK_CELL_ID)

        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        button.delegate = self
    }

    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
}
