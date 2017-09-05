//
//  AppDelegate.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//


import UIKit

extension UIView {
    func addFillerSubview(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false

        addSubview(subview)

        let views = ["subview": subview]
        let verticalConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|[subview]|",
            options: [],
            metrics: nil,
            views: views)
        let horizontalConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|[subview]|",
            options: [],
            metrics: nil,
            views: views)
        
        addConstraints(verticalConstraint + horizontalConstraint)
    }
}
