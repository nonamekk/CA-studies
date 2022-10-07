//
//  AlarmCellViewController.swift
//  alarms
//
//  Created by Admin on 2022-10-04.
//

import UIKit

class AlarmViewCell: UITableViewCell {

    
//    @IBOutlet weak var alarmTimeLabel: UILabel!
//    @IBOutlet weak var alarmDescriptionLabel: UILabel!
//    @IBOutlet weak var alarmActiveButton: UISwitch!
    
    
    @IBOutlet weak var alarmTimeLabel: UILabel!
    @IBOutlet weak var alarmActiveSwitch: UISwitch!
    @IBOutlet weak var alarmDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Do any additional setup after loading the view.
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        alarmTimeLabel.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
