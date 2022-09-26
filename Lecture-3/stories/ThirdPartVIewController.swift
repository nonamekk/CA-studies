//
//  ThirdPartVIewController.swift
//  stories
//
//  Created by Admin on 2022-09-26.
//

import UIKit

class ThirdPartVIewController: UIViewController {

    @IBOutlet weak var pressedButton: UIButton!
    @IBOutlet weak var labelMain: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var ghostsCount: Int = 0
    var switchChangeCount: Int = 0
    
    @IBAction func buttonPressed(_ sender: Any) {
        labelMain.text = "Third"
        ghostsCount = 0
        view.backgroundColor = .white
        labelMain.textColor = .black
        
        print("button pressed")
    }
    
    @IBAction func switchChange(_ sender: UISwitch) {
        switchChangeCount += 1
        print("switch changed")
        if sender.isOn {
            view.backgroundColor = .orange
            labelMain.textColor = .black
        } else {
            view.backgroundColor = .black
            labelMain.textColor = .white
            if ghostsCount < 6 {
                labelMain.text?.append("👻")
                ghostsCount +=  1
            } else if switchChangeCount == 31 {
                labelMain.text = "Booo!"
            }
            else {
                labelMain.text = ""
            }
            
        }
    }
}
