//
//  QuestionsViewCell.swift
//  StackOverflowCollections
//
//  Created by Malea Kotelo on 10/26/17.
//  Copyright © 2017 Malea Kotelo. All rights reserved.
//

import UIKit

class QuestionsViewCell: UICollectionViewCell {
   
    @IBOutlet weak var acceptedQuestionsImageView: UIImageView!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var questionsTitleLabel: UILabel!
    @IBOutlet weak var answersCount: UILabel!
    
    func confiqureQuestionsCell(item: QuestionsModel, questionsViewModel: QuestionsViewModel) {
        //set values to labels
        let questionTagsArray = item.tags! as NSArray
        let questionsTags = questionTagsArray.componentsJoined(by: " ")
        tagsLabel.text = questionsTags
        answersCount.text = "\(item.answerCount!)"
        questionsTitleLabel.text = questionsViewModel.decodeHTMLString(parsedString: item.title!)

        if item.acceptedAnswerID == nil {
            acceptedQuestionsImageView.image =  UIImage(named: "circle.png")

        } else {
            acceptedQuestionsImageView.image =  UIImage(named: "greencircle.png")

        }
    }
}


