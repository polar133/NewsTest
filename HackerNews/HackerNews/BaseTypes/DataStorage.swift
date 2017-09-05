//
//  DataStorage.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

public class DataStorage{
    
    static func save (_ stories: [Story]) {
        DispatchQueue.main.async(execute: {
            let uiRealm = try! Realm()
            try! uiRealm.write { () -> Void in
                for story in stories {
                    uiRealm.add(story, update: true)
                }
            }
        })
    }
    
    
    static func retrieve () -> [Story] {
        var list = [Story]()
        let uiRealm = try! Realm()
        let results: Results<Story> = uiRealm.objects(Story.self)
        
        for item in results { list.append(item) }
        
        return list
    }
    
}
