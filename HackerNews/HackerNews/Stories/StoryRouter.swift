//
//  StoryRouter.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import Foundation
import UIKit

protocol StoryListNavigationDelegate: class {
    func storyListSelected(for story: Story)
}

protocol StoryDetailsNavigationDelegate: class {
    func storyDetailsCloseDidTap()
}

final class StoriesRouter {
    
    public let parentViewController: UIViewController
    
    fileprivate var presenters = [String: ViewPresenter]()
    
    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }
}

extension StoriesRouter: Router {
    
    
    func showInitial() {
        let storyListPresenter = StoryListViewPresenter(navigationDelegate: self)
        storyListPresenter.present(in: parentViewController)
        
        presenters["StoryList"] = storyListPresenter
    }
    
    func close() {
        presenters.keys.forEach { [unowned self] in
            self.removePresenter(for: $0)
        }
    }
    
    fileprivate func removePresenter(for key: String) {
        let storyDetailsPresenter = presenters[key]
        storyDetailsPresenter?.remove()
        
        presenters[key] = nil
    }
}

extension StoriesRouter: StoryListNavigationDelegate {
    func storyListSelected(for story: Story) {
        let storyDetailsPresenter = StoryDetailPresenter(story: story, navigationDelegate: self)
        storyDetailsPresenter.present(in: parentViewController)
        presenters["storyListPresenter"] = storyDetailsPresenter
    }
}

extension StoriesRouter: StoryDetailsNavigationDelegate {
    func storyDetailsCloseDidTap() {
        removePresenter(for: "storyListPresenter")
    }
}
