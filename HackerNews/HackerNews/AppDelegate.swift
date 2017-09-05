//
//  AppDelegate.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainRouter: Router?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = UIViewController()
        
        window = UIWindow()
        
        window?.rootViewController = rootViewController
        
        //Load first view
        let storiesRouter = StoriesRouter(parentViewController: rootViewController)
        storiesRouter.showInitial()
        
        window?.makeKeyAndVisible()
        mainRouter = storiesRouter
        
        return true
    }

}

