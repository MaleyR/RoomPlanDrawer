//
//  LoadableView.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 22.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

protocol LoadableView {
    func updateLoadingIndicator(isVisible: Bool)
}

class LoadableViewController: UIViewController, LoadableView {
    private let loadingIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds
        
        var rect = loadingIndicator.frame
        rect.origin.x = (screenSize.width - rect.width) / 2
        rect.origin.y = (screenSize.height - rect.height) / 2
        loadingIndicator.frame = rect
        
        self.view.addSubview(loadingIndicator)
        loadingIndicator.isHidden = true
    }
    
    func updateLoadingIndicator(isVisible: Bool) {
        if isVisible {
            showLoadingIndicator()
        } else {
            hideLoadingIndicator()
        }
    }
}

// MARK: - Private
private extension LoadableViewController {
    func showLoadingIndicator() {
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        loadingIndicator.isHidden = true
        loadingIndicator.stopAnimating()
    }
}
