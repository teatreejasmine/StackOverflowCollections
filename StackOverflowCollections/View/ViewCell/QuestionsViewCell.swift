//
//  QuestionsViewCell.swift
//  StackOverflowCollections
//
//  Created by Malea Kotelo on 10/26/17.
//  Copyright © 2017 Malea Kotelo. All rights reserved.
//

import UIKit

class QuestionsViewCell: UICollectionViewCell {
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var tags: UILabel!
    @IBOutlet weak var questionsViewLabel: UILabel!
    
    func confiqureQuestionsCell(item: QuestionsModel) {

        let questionTags = item.tags! as NSArray
        questionsViewLabel.text = item.title
        answersLabel.text = "\(item.answerCount!)"
        tags.text = questionTags.componentsJoined(by: " ")
        
        if item.acceptedAnswerID == nil {
            imageView.image =  UIImage(named: "clearcircle.png")

        } else {
            imageView.image =  UIImage(named: "greencircle.png")

        }
    }
}
