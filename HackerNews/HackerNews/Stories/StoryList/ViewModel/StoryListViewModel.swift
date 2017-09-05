//
//  StoryListViewModel.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import Foundation


protocol StoryListViewModelDelegate: class {
    func storyListUpdated()
}

final class StoryListViewModel {
    
    var storiesCount: Int {
        return stories.count
    }
    
    private weak var delegate: StoryListViewModelDelegate?
    private weak var navigationDelegate: StoryListNavigationDelegate?
    
    private let storyListInteractor: StoryListInteractor
    private var stories = [Story]()
    
    init(storyListInteractor: StoryListInteractor, navigationDelegate: StoryListNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
        self.storyListInteractor = storyListInteractor
        
        loadStories()
    }
    
    func loadStories() {
        
        storyListInteractor.fetchStories { [unowned self] result in
         
            switch result {
                case .success(let storyResult):
                    self.stories = []
                    
                    let elements : [Int]  = UserDefaults.standard.array(forKey: "deleted_items") as? [Int] ?? []
                    if elements.count > 0 {
                        for story in storyResult{
                            if !elements.contains(story.objectID){
                                self.stories.append(story)
                            }
                        }
                    }else{
                        self.stories = storyResult
                    }
                    
                    DispatchQueue.main.async {
                        self.delegate?.storyListUpdated()
                    }
                case .failure( _):
                    //Offline
                    let stories = DataStorage.retrieve()
                    
                    let elements : [Int]  = UserDefaults.standard.array(forKey: "deleted_items") as? [Int] ?? []
                    if elements.count > 0 {
                        for story in stories{
                            if !elements.contains(story.objectID){
                                self.stories.append(story)
                            }
                        }
                    }else{
                        self.stories = stories
                    }
                    
                    
                    DispatchQueue.main.async {
                        self.delegate?.storyListUpdated()
                }
            }
        }
    }
    
    private func story(at indexPath: IndexPath) -> Story {
        return stories[indexPath.row]
    }
    
    func removeStory(index : Int){
        let story = self.stories.remove(at: index)
        ignoreStory(story: story)
    }
    
    // Sets the delegate to bind the UI
    func bind(_ delegate: StoryListViewModelDelegate) {
        self.delegate = delegate
    }
    
    func storyData(at indexPath: IndexPath) -> String {
        let story = self.story(at: indexPath)
        return story.storyTitle ?? ""
    }
    
    func getTitle(at indexPath: IndexPath) -> String {
        let story = self.story(at: indexPath)
        return story.storyTitle ?? ""
    }
    
    func getSubtitle(at indexPath: IndexPath) -> String {
        let story = self.story(at: indexPath)
        var subtitle = ""
        if let author = story.author {
            subtitle = "\(author)"
        }
        
        if let created = story.createdAt{
            subtitle = subtitle + " - \(created.getTimeAgoSinceNow())"
        }
        
        return subtitle
    }
    
    func ignoreStory(story: Story){
        var elements : [Int] = UserDefaults.standard.array(forKey: "deleted_items") as? [Int] ?? []
        elements.append(story.objectID)
        UserDefaults.standard.setValue(elements, forKey: "deleted_items")
    }
    
    func storyDetailSelected(at indexPath: IndexPath) {
        let story = self.story(at: indexPath)
        navigationDelegate?.storyListSelected(for: story)
    }
}




