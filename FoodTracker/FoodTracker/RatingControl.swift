//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Sneha gindi on 07/11/16.
//  Copyright © 2016 Sneha gindi. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    //Mark: Properties
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    
   // Mark: Implementation
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<starCount {
            let button = UIButton()
            
            button.setImage(emptyStarImage, for: .normal)
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.highlighted, .selected])
            
            button.addTarget(self, action: #selector(ratingButtonTapped), for: .touchUpInside)
            ratingButtons += [button]
            addSubview(button)
        }
    }

    override func layoutSubviews() {
        
        //Set the button's height and width to a sqaure similar to the frame's height.
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)

    // Offset each button's origin by the length of the button plus spacing.
        for(index, button) in ratingButtons.enumerated(){
            buttonFrame.origin.x = CGFloat(index * (44 + spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    //Mark : Button Action
    func ratingButtonTapped(button: UIButton){
    
        rating = ratingButtons.index(of: button)! + 1
        
        updateButtonSelectionStates()
    
    }
    
    override public var intrinsicContentSize:CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
                return CGSize(width: width, height: buttonSize)
            }
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, then that star should be selected.
            button.isSelected = index < rating
        }
    }
}

