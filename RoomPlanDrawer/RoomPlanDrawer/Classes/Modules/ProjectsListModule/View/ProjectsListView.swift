//
//  ProjectsListView.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

class ProjectsListView: LoadableViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private let tableDelegate = ProjectsListTableDelegate()
    private let tableDataSource = ProjectsListTableDataSource()
    
    var presenter: ProjectsListPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        presenter?.viewDidLoad(self)
    }
}

// MARK: - ProjectsListViewType
extension ProjectsListView: ProjectsListViewType {
    func apply(rows: [Row]) {
        self.tableDataSource.rows = rows
        self.tableView.reloadData()
    }
}

// MARK: - Private
private extension ProjectsListView {
    func setup() {
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        
        tableView.delegate = tableDelegate
        tableView.dataSource = tableDataSource
        tableDelegate.didSelectRowAtIndex = { [weak self] index in
            guard let self = self else { return }
            self.presenter?.viewDidSelect(self, index: index)
        }
    }
}
