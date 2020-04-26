//
//  ProjectDetailsView.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

class ProjectDetailsView: UIViewController {
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var scrollContentView: UIView!
    @IBOutlet private weak var scrollViewContentWidth: NSLayoutConstraint!
    @IBOutlet private weak var scrollViewContentHeight: NSLayoutConstraint!
    
    var presenter: ProjectDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 4
        scrollView.delegate = self
        
        presenter?.viewDidLoad(self, baseView: scrollContentView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear(self)
    }
}

// MARK: - ProjectDetailsViewType
extension ProjectDetailsView: ProjectDetailsViewType {
    func apply(size: CGSize) {
        scrollView.zoomScale = 0.1
        scrollViewContentWidth.constant = size.width
        scrollViewContentHeight.constant = size.height
        scrollView.setNeedsLayout()
        scrollView.layoutIfNeeded()
    }
    
    func apply(offset: CGPoint) {
        let offsetPoint = CGPoint(x: offset.x * scrollView.zoomScale - UIScreen.main.bounds.width / 2.0,
                                  y: offset.y * scrollView.zoomScale - UIScreen.main.bounds.height / 2.0)
        
        scrollView.contentOffset = offsetPoint
    }
}

// MARK: - UIScrollViewDelegate
extension ProjectDetailsView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollContentView
    }
}
