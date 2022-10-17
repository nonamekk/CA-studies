//
//  ContactCreationViewController.swift
//  contacts_list
//
//  Created by Admin on 2022-10-16.
//

import UIKit

struct ContactData {
    let elementIndex: Int
    let name: String
    let phone: String
}

class ContactCreationViewController: UIViewController {

   
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    var elementIndex: Int? = nil
    
    @IBAction func unwindHome(_ segue: UIStoryboardSegue) {
            // this is intentionally blank
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.setContactData(_:)),
                                                   name: NSNotification.Name(rawValue: "set_contact_data"),
                                                   object: nil)
    }
    
    @IBAction func addButton(_ sender: Any) {
        if nameTextField.text != "" && phoneTextField.text != "" {
            if let i = elementIndex {
                contactsTupleList[i] = (nameTextField.text!, phoneTextField.text!)
            } else {
                contactsTupleList.append((nameTextField.text!, phoneTextField.text!))
            }
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: "update_table"), object: self)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @objc func setContactData(_ notification: NSNotification) {
        if let data = notification.userInfo?["contact_data"] as? ContactData {
            nameTextField.text = data.name
            phoneTextField.text = data.phone
            elementIndex = data.elementIndex
        }
    }
}
