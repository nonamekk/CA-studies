//
//  MainPageViewController.swift
//  autoresize
//
//  Created by nonamekk on 2022-10-18.
//

import UIKit

class MainPageViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func buttonPress(_ sender: Any) {
        if let text = textField.text {
            textLabel.text = text
        }
    }
    
}
