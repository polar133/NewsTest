//
//  StoryListViewPresenter.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import UIKit

final class StoryListViewPresenter: ViewPresenter {
    
    private let viewFactory: StoryListViewFactory
    
    init(navigationDelegate: StoryListNavigationDelegate) {
        viewFactory = StoryListViewFactory(navigationDelegate: navigationDelegate)
    }
    
    func present(in parentViewController: UIViewController) {
        parentViewController.addFillerChildViewController(viewFactory.viewController)
    }
    
    func remove() {
        viewFactory.viewController.view.removeFromSuperview()
        viewFactory.viewController.removeFromParentViewController()
    }
}
