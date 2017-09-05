//
//  StoryViewController.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet var storyWebView: UIWebView!
    @IBOutlet var backButton : UIButton!
    
    private unowned let viewModel: StoryDetailViewModel
    
    init(viewModel: StoryDetailViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL (string: viewModel.url )
        let requestObj = URLRequest(url: url!)
        storyWebView.loadRequest(requestObj)
    }
    
    
    @IBAction func onCloseButton(_ sender: Any) {
        viewModel.closeButtonDidTap()
    }

}
