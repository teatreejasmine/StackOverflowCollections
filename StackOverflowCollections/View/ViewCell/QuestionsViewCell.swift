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
    @IBOutlet weak var tags: UILabel!
    @IBOutlet weak var questionsViewLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    
    func confiqureQuestionsCell(item: QuestionsModel) {

        let questionTags = item.tags! as NSArray
        questionsViewLabel.text = item.title
        tags.text = questionTags.componentsJoined(by: " ")
        answersLabel.text = "\(item.answerCount!)"
        
        if item.acceptedAnswerID == nil {
            imageView.image =  UIImage(named: "circle.png")
            print("no answer")

        } else {
            imageView.image =  UIImage(named: "greencircle.png")
            print("others")

        }
    }
}
