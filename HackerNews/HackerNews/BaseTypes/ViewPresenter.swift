//
//  AppDelegate.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol ViewPresenter: class {
    func present(in parentViewController: UIViewController)
    func remove()
}
