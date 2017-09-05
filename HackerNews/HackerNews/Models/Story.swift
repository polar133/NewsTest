//
//  Story.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import Realm
import RealmSwift
import Unbox

class Story: Object, Unboxable {
    
    
    dynamic var objectID = -1
    var storyId : Int?
    dynamic var storyTitle : String?
    dynamic var storyUrl : String?
    
    dynamic var createdAt : Date?
    dynamic var title : String?
    dynamic var url : String?
    dynamic var author : String?
    
    dynamic var isIgnored = false
    
    required init(unboxer: Unboxer) throws {
        
        self.objectID = try unboxer.unbox(key: "objectID")
        
        self.storyId = try? unboxer.unbox(key: "story_id")
        self.storyTitle = try? unboxer.unbox(key: "story_title")
        self.storyUrl = try? unboxer.unbox(key: "story_url")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'.000Z"
        self.createdAt = try? unboxer.unbox(key: "created_at", formatter: dateFormatter)
        
        self.title = (try? unboxer.unbox(key: "title")) ?? ""
        self.url = try? unboxer.unbox(key: "url")
        self.author = try? unboxer.unbox(key: "author")
        
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    override static func primaryKey() -> String? {
        return "objectID"
    }
}
