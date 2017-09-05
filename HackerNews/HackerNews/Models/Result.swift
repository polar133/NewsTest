//
//  Result.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import Foundation

enum Result<TResult, TError> {
    case success(TResult)
    case failure(TError)
}
