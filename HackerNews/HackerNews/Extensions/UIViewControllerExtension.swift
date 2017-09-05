//
//  AppDelegate.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//


import UIKit

extension UIViewController {
    func addFillerChildViewController(_ childController: UIViewController, toView: UIView? = nil) {
        addChildViewController(childController)
        var parentView = childController.view
        if let toView = toView {
            parentView = toView
        }
        view.addFillerSubview(parentView!)
        childController.didMove(toParentViewController: self)
    }
}
