//
//  ViewController.swift
//  alarms
//
//  Created by Admin on 2022-10-04.
//

import UIKit
import Foundation


class ViewController: UIViewController {

    @IBOutlet weak var alarmTimePicker: UIDatePicker!
    @IBOutlet weak var alarmDescription: UITextField!
    
    @IBAction func createAlarmButtonCreate(_ sender: Any) {
        let uuid = UUID().uuidString
        
        let date = alarmTimePicker.date
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        
        let alarmTime: Int = hour * 60 + minute
        
        var description = "Alarm"
        if let d = alarmDescription.text {
            if d != "" {
                description = d
            }
        }
        
        
        let newAlarm: Alarm = Alarm(uuid: uuid, time: alarmTime, isOn: true, description: description)
        newAlarm.add()
        
//        alarm.list.append(newAlarm)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

}
