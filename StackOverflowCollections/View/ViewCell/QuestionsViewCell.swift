//
//  QuestionsViewCell.swift
//  StackOverflowCollections
//
//  Created by Malea Kotelo on 10/26/17.
//  Copyright © 2017 Malea Kotelo. All rights reserved.
//

import UIKit

class QuestionsViewCell: UICollectionViewCell {
    
    
    
    func confiqureUserCell(item: QuestionsModel){
        
        
//
        if let label = self.viewWithTag(100) as? UILabel {
            label.text = "\(item.answerCount!)"
            print("indaclub",item.answerCount!)
            

        }
        
//        self.userImage.sd_setImage(with: URL(string: (item.picture?.medium)!))
//        self.userName.text = item.name?.getFullName()
//        self.userEmail.text = item.email
        
    }
}
