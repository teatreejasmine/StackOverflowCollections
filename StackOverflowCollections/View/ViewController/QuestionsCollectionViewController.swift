//
//  QuestionsCollectionViewController.swift
//  StackOverflowCollections
//
//  Created by Malea Kotelo on 10/31/17.
//  Copyright © 2017 Malea Kotelo. All rights reserved.
//

import UIKit
import NVActivityIndicatorView



class QuestionsCollectionViewController: UICollectionViewController, NVActivityIndicatorViewable, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var questionsViewModel: QuestionsViewModel!
    var questionsModel = [QuestionsModel]()
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    let size = CGSize(width: 30, height: 30)

    override func viewDidLoad() {
        super.viewDidLoad()
        //Animation to indicate data is being loaded
        startAnimating(size, message: "Loading...", type: NVActivityIndicatorType(rawValue: 1)!)
        
        let width = view.frame.size.width
        print("width is \(width)")
        let height = view.frame.size.height
         print("height is \(height)")
        let layout = collectionView?.collectionViewLayout  as! UICollectionViewFlowLayout
        
        //layout.itemSize = CGSize(width: 1200, height: 150)
        layout.itemSize.width = width
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width
        
        return CGSize(width: width, height: 200)
    }
   
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    
  

}
