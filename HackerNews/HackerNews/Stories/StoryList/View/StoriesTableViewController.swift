//
//  StoriesTableViewController.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import UIKit
import SwipeCellKit
import PullToRefreshSwift
class StoriesTableViewController: UITableViewController {
    
    unowned let viewModel: StoryListViewModel
    
    init(viewModel: StoryListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(self)
        
        let nib = UINib.init(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableViewAutomaticDimension

        tableView.estimatedRowHeight = 100
        tableView.addPullRefresh { [weak self] in
            self?.viewModel.loadStories()
            self?.tableView.stopPullRefreshEver()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.storiesCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! StoryTableViewCell
        let title = viewModel.getTitle(at: indexPath)
        let subtitle = viewModel.getSubtitle(at: indexPath)
        cell.configure(title: title, subtitle: subtitle)
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.storyDetailSelected(at: indexPath)
    }
    
}

extension StoriesTableViewController: SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            self.viewModel.removeStory(index: indexPath.row)
        }
        
        deleteAction.image = UIImage(named: "delete")
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        var options = SwipeTableOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
}

extension StoriesTableViewController: StoryListViewModelDelegate {
    func storyListUpdated() {
        tableView.reloadData()
    }
}
