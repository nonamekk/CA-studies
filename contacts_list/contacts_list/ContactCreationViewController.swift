//
//  ContactCreationViewController.swift
//  contacts_list
//
//  Created by Admin on 2022-10-16.
//

import UIKit

class ContactCreationViewController: UIViewController {

   
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBAction func unwindHome(_ segue: UIStoryboardSegue) {
            // this is intentionally blank
        }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButton(_ sender: Any) {
        if nameTextField.text != "" && phoneTextField.text != "" {
            contactsTupleList.append((nameTextField.text!, phoneTextField.text!))
            NotificationCenter.default.post(name: Notification.Name(rawValue: "update_table"), object: self)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
