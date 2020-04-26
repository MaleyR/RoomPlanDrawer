//
//  ProjectsListTableDelegate.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

class ProjectsListTableDelegate: NSObject {
    var didSelectRowAtIndex: ((Int) -> Void)?
}

// MARK: - UITableViewDelegate
extension ProjectsListTableDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didSelectRowAtIndex?(indexPath.row)
    }
}
