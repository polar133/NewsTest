//
//  StoryDetailPresenter.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import UIKit

final class StoryDetailPresenter: ViewPresenter {
    
    private let viewFactory: StoryDetailViewFactory
    
    init(story: Story, navigationDelegate: StoryDetailsNavigationDelegate) {
        viewFactory = StoryDetailViewFactory(story: story, navigationDelegate: navigationDelegate)
    }
    
    func present(in parentViewController: UIViewController) {
        parentViewController.addFillerChildViewController(viewFactory.viewController)
    }
    
    func remove() {
        viewFactory.viewController.view.removeFromSuperview()
        viewFactory.viewController.removeFromParentViewController()
    }
}
