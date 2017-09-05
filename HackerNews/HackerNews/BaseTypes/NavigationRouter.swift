//
//  NavigationRouter.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol NavRouter: class {
    func add(viewController: UIViewController)
    func back()
}

final class NavigationRouter {
    
    public let navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
}

extension NavigationRouter: NavRouter {
    
    func add(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func back() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
}
