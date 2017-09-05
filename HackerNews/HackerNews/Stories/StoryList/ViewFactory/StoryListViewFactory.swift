//
//  StoryListViewFactory.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import Foundation

final class StoryListViewFactory {
    
    let viewController: StoriesTableViewController
    private let viewModel: StoryListViewModel
    
    init(navigationDelegate: StoryListNavigationDelegate) {
        let interactor = StoryListInteractor()
        viewModel = StoryListViewModel(storyListInteractor: interactor, navigationDelegate: navigationDelegate )
        viewController = StoriesTableViewController(viewModel: viewModel)
    }
}
