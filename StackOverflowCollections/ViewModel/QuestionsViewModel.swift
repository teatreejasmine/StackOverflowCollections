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
    
    func decodeHTMLString(parsedString: String) -> String? {
        var decodedString = ""
        guard let data = parsedString.data(using: .utf8) else {
            return nil
            
        }
        do {
            decodedString = try NSAttributedString(data: data,
                                                   options: [.documentType: NSAttributedString.DocumentType.html,.characterEncoding: String.Encoding.utf8.rawValue],
                                                   documentAttributes: nil).string
        } catch let error {
            print("error occured \(error)")
        }
        return decodedString
    }
    
    func isQuestionModelEmpty() -> Bool {
        return questionsList.isEmpty
    }
    
    
}
