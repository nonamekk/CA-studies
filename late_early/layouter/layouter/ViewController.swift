//
//  ViewController.swift
//  layouter
//
//  Created by Admin on 2022-10-13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueBigViewContstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueBigViewContstraint.isActive = true
    }


}

