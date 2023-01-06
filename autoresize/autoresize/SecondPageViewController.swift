//
//  SecondPageViewController.swift
//  autoresize
//
//  Created by nonamekk on 2022-10-18.
//

import UIKit

class SecondPageViewController: UIViewController, UITextFieldDelegate {

    @IBAction func textFieldEditChange(_ sender: Any) {
        textLabel.text = textField.text
    }
    @IBOutlet weak var viewBoxHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var viewBox: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        viewBoxHeightConstraint.constant = textLabel.frame.height
        return true
    }

}
