//
//  QuestionsModel.swift
//  StackOverflowCollections
//
//  Created by Malea Kotelo on 10/26/17.
//  Copyright © 2017 Malea Kotelo. All rights reserved.
//

import Foundation
import ObjectMapper


class QuestionsModel: Mappable{
    
    var title: String?
    var tags: Array<Any>?
    var answerCount: Int?
    var acceptedAnswerID: String?
    
    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        tags <- map["tags"]
        answerCount <- map["answer_count"]
        acceptedAnswerID <- map["accepted_answer_id"]
    
    }

}
