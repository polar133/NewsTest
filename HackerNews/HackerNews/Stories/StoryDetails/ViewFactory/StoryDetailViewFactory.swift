//
//  StoryDetailViewFactory.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import Foundation

final class StoryDetailViewFactory {
    private var viewModel: StoryDetailViewModel
    private(set) var viewController: StoryViewController
    
    init(story: Story, navigationDelegate: StoryDetailsNavigationDelegate) {
        viewModel = StoryDetailViewModel(story: story, navigationDelegate: navigationDelegate)
        viewController = StoryViewController(viewModel: viewModel)
    }
}
