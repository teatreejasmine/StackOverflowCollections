//
//  StackOverflowCollectionsTests.swift
//  StackOverflowCollectionsTests
//
//  Created by Malea Kotelo on 10/25/17.
//  Copyright © 2017 Malea Kotelo. All rights reserved.
//

import XCTest
@testable import StackOverflowCollections

class StackOverflowCollectionsTests: XCTestCase {
    
    let questionsViewModel = QuestionsViewModel()
     var questionsList = [QuestionsModel]()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
 
    func testHTMLStringDecoding()  {
        
        let stringToDecode = questionsViewModel.decodeHTMLString(parsedString: "What is this &lt;&gt; ")
        XCTAssertTrue(stringToDecode == "What is this <> ")
        
    }

    
}
