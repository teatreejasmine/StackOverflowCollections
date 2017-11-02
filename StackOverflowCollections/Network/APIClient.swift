//
//  APIClient.swift
//  StackOverflowCollections
//
//  Created by Malea Kotelo on 10/26/17.
//  Copyright © 2017 Malea Kotelo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class APIClient: NSObject {
    var _questionsList = [QuestionsModel] ()
    
    var questionsList: [QuestionsModel] {
        return _questionsList
    }
    
    // Download questions data JSON from the Stackoverflow API
    func downloadQuestions(complete: @escaping DownloadComplete) {
        
        Alamofire.request(QUESTIONS_URL).responseObject{ (response: DataResponse<QuestionsResponse>) in
            let list = response.result.value
            if let questionsModel = list?.questionsModelList {
                for(_ , questions) in questionsModel.enumerated() {
                    self._questionsList.append(questions)
                }
            }
            complete()
        }
    }

}
