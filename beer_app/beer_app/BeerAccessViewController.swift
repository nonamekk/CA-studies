//
//  BeerAccessViewController.swift
//  beer_app
//
//  Created by Admin on 2022-09-27.
//

import UIKit

//extension Date {
//    func dateFormatter(date: Date) {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy"
//    }
//}

class BeerAccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var helloLabel: UILabel!
    
    var userName: String = ""
    var userSurname: String = ""
    var dateOfBirth: Date = Date()
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBAction func nameChanged(_ sender: Any) {
        userName = nameTextField.text!
    }
    
    
    @IBAction func surnameChanged(_ sender: Any) {
        userSurname = surnameTextField.text!
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        dateOfBirth = sender.date
    }
    
    @IBAction func buttonContinuePress(_ sender: UIButton) {
        writeLabel(userName, userSurname, dateOfBirth)
    }
    
    func writeLabel(_ userName: String, _ userSurname: String, _ dateOfBirth: Date) {
        if userName != "" && userSurname != "" {
            let timeDifference: Int = Int(dateOfBirth.timeIntervalSinceNow)
            if timeDifference < -568036800 {
                helloLabel.text = "Hello, \(userName) \(userSurname), you are able to drink beer legally in Lithuania"
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
