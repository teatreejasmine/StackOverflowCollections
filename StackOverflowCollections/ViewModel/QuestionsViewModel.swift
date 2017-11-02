//
//  QuestionsViewModel.swift
//  StackOverflowCollections
//
//  Created by Malea Kotelo on 10/26/17.
//  Copyright © 2017 Malea Kotelo. All rights reserved.
//

import UIKit

class QuestionsViewModel: NSObject {
   
    @IBOutlet weak var apiClient: APIClient!
    var questionsList = [QuestionsModel]()
    
    func getQuestions(complete: @escaping DownloadComplete) {
        self.apiClient.downloadQuestions {
            self.questionsList = self.apiClient._questionsList
            complete()
        }
    }
    
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return questionsList.count
    }
    

}
