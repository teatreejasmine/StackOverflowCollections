//
//  QuestionsResponse.swift
//  StackOverflowCollections
//
//  Created by Malea Kotelo on 10/26/17.
//  Copyright © 2017 Malea Kotelo. All rights reserved.
//

import Foundation
import ObjectMapper

class QuestionsResponse: Mappable {
    
    var questionsModelList : [QuestionsModel]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        questionsModelList <- map ["items"]
    }

}
