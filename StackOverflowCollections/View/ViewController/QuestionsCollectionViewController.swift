//
//  QuestionsCollectionViewController.swift
//  StackOverflowCollections
//
//  Created by Malea Kotelo on 10/31/17.
//  Copyright © 2017 Malea Kotelo. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


private let reuseIdentifier = "Cell"

class QuestionsCollectionViewController: UICollectionViewController, NVActivityIndicatorViewable {
    
    
    @IBOutlet var questionsViewModel: QuestionsViewModel!
    var questionsModel = [QuestionsModel]()
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    let size = CGSize(width: 30, height: 30)

    override func viewDidLoad() {
        super.viewDidLoad()
        //Animation to indicate data is being loaded
        startAnimating(size, message: "Loading...", type: NVActivityIndicatorType(rawValue: 1)!)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        downloadQuestions()
        
    }
    
    func downloadQuestions() {
        self.questionsViewModel.getQuestions {
            self.questionsModel = Array(self.questionsViewModel.questionsList)
            self.collectionView?.reloadData()
            self.stopAnimating()
        }
    }

    func isQuestionModelEmpty() -> Bool {
        return self.questionsModel.isEmpty
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.questionsModel.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionsViewCell", for: indexPath) as! QuestionsViewCell
        if !self.isQuestionModelEmpty() {
            cell.confiqureQuestionsCell(item: self.questionsModel[indexPath.row])
        }
        
        return cell
    }

}
