//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Sneha gindi on 07/11/16.
//  Copyright © 2016 Sneha gindi. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
   //Mark: FoodTracker Tests
    
   // Tests to confirm that Meal initailizer returns nil when no name or rating is negative
    func testMealInitialization() {
        //Succes case
        let potentialItem = Meal[name: "Newest Meal", photo: nil, rating: 5]
        XCTAssertNotNil(potentialItem)
        
        //Failure Cases
        let noName = Meal[name: "", photo: nil, rating: 0]
        XCTAssertNotNil(noName, "Empty name is invalid")
        
        let badRating = Meal[name: "Really bad rating", photo: nil, rating: -1]
        XCTAssertNotNil(badRating, "Negative ratings are invalid, be positive!")
    }
}
