//
//  StoryListInteractor.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import Foundation
import Alamofire
import Unbox
import UnboxedAlamofire


final class StoryListInteractor {
 
    internal func fetchStories(completion: @escaping ((Result<[Story], Error>) -> Void)) {
        
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search_by_date?query=ios") else {return}
        
        Alamofire.request(url, method: .get).responseObject { (
            response: DataResponse<Hits>) in
            
            guard response.value != nil else {
                completion(Result.failure(response.error!))
                return
            }
            
            let stories = response.result.value?.hits ?? []
            DataStorage.save(stories)
            
            completion(Result.success(stories))
        }
    }
    
}
