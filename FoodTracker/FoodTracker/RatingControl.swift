//  RatingControl.swift
//  FoodTracker
//
//  Created by Brosteau on 9/08/17.
//  Copyright © 2017 Brosteau Alexandre. All rights reserved.
//

import UIKit
// @IBDesignable. This lets Interface Builder instantiate and draw a copy of your control directly in the canvas

@IBDesignable class RatingControl: UIStackView {
    
    
    //MARK: Properties
    
    private var ratingButtons = [UIButton]()
    var rating = 0
    
    //  You can also specify properties that can then be set in the Attributes inspector with @IBInspectable
    // These lines define the size of your buttons and the number of buttons in your control.
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    //MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    
    //MARK: Private Methods
    
    //Make sure the button is added, regardless of which initializer is called
    private func setupButtons () {
        
        // clear any existing buttons
        for button in ratingButtons {
            
            // First, it removes the button from the list of views managed by the stack view.
            removeArrangedSubview(button)
            
            // Next, the code removes the button from the stack view entirely
            button.removeFromSuperview()
        }
        // Finally once all the buttons have been removed, it clears the ratingButtons array.
        ratingButtons.removeAll()
        
        for _ in 0..<starCount {
            
            // Create the button and set the background in Red
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for:.touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the ratign button array
            ratingButtons.append(button)
        }
        
        
        
        
        
    }
    
}
