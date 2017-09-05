//
//  StoryDetailViewModel.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import Foundation

final class StoryDetailViewModel {
    
    var url: String
    
    private weak var navigationDelegate: StoryDetailsNavigationDelegate?
    
    init(story: Story, navigationDelegate: StoryDetailsNavigationDelegate) {
        url = story.storyUrl ?? "http://nerdist.com/wp-content/uploads/2016/03/Rick-And-Morty-Eyes.jpg"
        self.navigationDelegate = navigationDelegate
    }
    
    func closeButtonDidTap() {
        navigationDelegate?.storyDetailsCloseDidTap()
    }
}
