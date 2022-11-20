//
//  AlarmCellViewController.swift
//  alarms
//
//  Created by Admin on 2022-10-04.
//

import UIKit

class AlarmViewCell: UITableViewCell {

    @IBOutlet weak var alarmTimeLabel: UILabel!
    @IBOutlet weak var alarmActiveSwitch: UISwitch!
    @IBOutlet weak var alarmDescriptionLabel: UILabel!
    
    /// Changes alarm cell isOn switch, by pressing a switch button
    @IBAction func alarmSwitchAction(_ sender: Any) {
        if let index = getIndexPath()?.row {
            let alarms = Alarms()
            alarms.changeSwitch(at: index)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// Provides cell IndexPath with superview
    ///  ## Returns: ##
    ///  IndexPath: [0, 0] or [section, row[
    func getIndexPath() -> IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView - getIndexPath")
            return nil
        }
        let indexPath = superView.indexPath(for: self)
        return indexPath
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        return self.next(of: UITableView.self)
    }
    
    var indexPath: IndexPath? {
        return self.tableView?.indexPath(for: self)
    }
}

extension UIResponder {
    /**
     * Returns the next responder in the responder chain cast to the given type, or
     * if nil, recurses the chain until the next responder is nil or castable.
     */
    func next<U: UIResponder>(of type: U.Type = U.self) -> U? {
        return self.next.flatMap({ $0 as? U ?? $0.next() })
    }
}
