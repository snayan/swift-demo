//
//  RatingControl.swift
//  demo5
//
//  Created by yang.zhang on 2018/9/28.
//  Copyright © 2018年 yang.zhang. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    
    private var ratingButtons = [UIButton]();
    
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons();
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons();
        }
    }
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        setupButtons();
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder);
        setupButtons();
    }
    
    //MARK: Button Action
    
    @objc func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button,\(button), is not in the ratingButtons array:\(ratingButtons)");
        }
        let selectedRating = index + 1;
        if selectedRating == rating {
            rating = 0;
        } else {
            rating = selectedRating;
        }
    }
    
    //MARK: Private Methods
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button);
            button.removeFromSuperview();
        }
        ratingButtons.removeAll();
        
        let bundle = Bundle(for: type(of: self));
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection);
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection);
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection);
        
        for index in 0..<starCount {
            let button = UIButton();
            button.setImage(emptyStar, for: .normal);
            button.setImage(filledStar, for: .selected);
            button.setImage(highlightedStar, for: .highlighted);
            button.setImage(highlightedStar, for: [.highlighted,.selected]);
            button.translatesAutoresizingMaskIntoConstraints = false;
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true;
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true;
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside);
            button.accessibilityLabel = "Set \(index + 1) star rating";
            addArrangedSubview(button);
            ratingButtons.append(button);
        }
        
        updateButtonSelectionStates()
        
    }
    
    private func updateButtonSelectionStates() {
        for  (index,button) in ratingButtons.enumerated() {
            button.isSelected = index < rating;
            let hint: String?;
            if rating == index + 1 {
                hint = "Tap to reset the rating to zero.";
            } else {
                hint = nil;
            }
            let value: String;
            switch (rating) {
            case 0:
                value = "No rating set.";
            case 1:
                value = "1 star set.";
            default:
                value = "\(rating) stars set.";
            }
            button.accessibilityValue = value;
            button.accessibilityHint = hint;
        }
    }
    
}
