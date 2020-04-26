//
//  ProjectsListTableDataSource.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

class ProjectsListTableDataSource: NSObject {
    var rows: [Row] = []
}

// MARK: - UITableViewDataSource
extension ProjectsListTableDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        
        cell.textLabel?.text = rows[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}
