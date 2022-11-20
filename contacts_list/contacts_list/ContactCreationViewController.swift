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
    
    var savingContact: ((String, String, Int?) -> ())!
    
    @IBAction func addButton(_ sender: Any) {
        if nameTextField.text != "" && phoneTextField.text != "" {
            if let i = elementIndex {
                savingContact(nameTextField.text!, phoneTextField.text!, i)
            } else {
                savingContact(nameTextField.text!, phoneTextField.text!, nil)
            }
            
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
