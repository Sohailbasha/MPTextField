//
//  MPTextField.swift
//  MPTextField
//
//  Created by Ilias Basha on 2/20/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import UIKit

class MPTextField: UITextField {

    var placeholderLabel = UILabel()
    var leftRightPadding: CGFloat
    var topBottomPadding: CGFloat
    public var placeholderActiveColor: UIColor = .red
    public var placeholderInactiveColor: UIColor = .lightGray
    
    init(placeholderText: String, leftRightPadding: CGFloat = 20, topBottomPadding: CGFloat = 10) {
        
        self.leftRightPadding = leftRightPadding
        self.topBottomPadding = topBottomPadding
        self.placeholderLabel.text = placeholderText
        
        placeholderLabel.sizeToFit()
        placeholderLabel.textColor = .lightGray
        
        let frame = CGRect(x: 0,
                           y: 0,
                           width: placeholderLabel.frame.width + leftRightPadding,
                           height: placeholderLabel.frame.height + topBottomPadding)
        
        super.init(frame: frame)
        self.addSubview(placeholderLabel)
        self.placeholderLabel.center = self.center
        self.addTarget(self, action: #selector(updatePlaceholder), for: .editingDidBegin)
        self.addTarget(self, action: #selector(returnPlaceholder), for: .editingDidEnd)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
    }
    
    @objc func updatePlaceholder() {
        UIView.transition(with: placeholderLabel, duration: 0.25, options: .transitionCrossDissolve, animations: {
            self.placeholderLabel.textColor = self.placeholderActiveColor
             var t = CGAffineTransform.identity
             t = t.translatedBy(x: -self.leftRightPadding, y: -self.leftRightPadding)
             t = t.scaledBy(x: 0.7, y: 0.7)
             self.placeholderLabel.transform = t
        }, completion: nil)
        
    }
    
    @objc func returnPlaceholder() {
        
        if let text = self.text, !text.isEmpty {
            return
        } else {
            UIView.transition(with: placeholderLabel, duration: 0.25, options: .transitionCrossDissolve, animations: {
                self.placeholderLabel.textColor = self.placeholderInactiveColor
                self.placeholderLabel.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
    
}
