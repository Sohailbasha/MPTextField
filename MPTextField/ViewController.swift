//
//  ViewController.swift
//  MPTextField
//
//  Created by Ilias Basha on 2/20/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textField = MPTextField(placeholderText: "Hello World")
        self.view.addSubview(textField)
        textField.center = self.view.center
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


