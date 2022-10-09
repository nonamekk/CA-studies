//
//  AlarmsListViewController.swift
//  alarms
//
//  Created by Admin on 2022-10-04.
//

import UIKit

struct Alarm: Codable {
    // time in minutes
    let uuid: String
    var time: Int
    var isOn: Bool
    var description: String
    
    func add() {
        var alarmsDefaults = Alarms.obtainArrayFromDefault()
        alarmsDefaults.append(self)
        Alarms.setArrayToDefault(alarmsDefaults)
    }
    
    func remove() {
        let alarmsDefaults = Alarms.obtainArrayFromDefault()
        
        if !alarmsDefaults.isEmpty {
            var newAlarmsDefaults: [Alarm] = []
            for each in alarmsDefaults {
                
                if each.uuid != self.uuid {
                    newAlarmsDefaults.append(each)
                }
                
            }
            Alarms.setArrayToDefault(newAlarmsDefaults)
        }
    }
    
    func changeSwitch() {
        let alarmsDefaults = Alarms.obtainArrayFromDefault()
        
        if !alarmsDefaults.isEmpty {
            var newAlarmsDefaults: [Alarm] = []
            for var each in alarmsDefaults {
                
                if each.uuid == self.uuid {
                    each.isOn = each.isOn ? false : true
                }
                newAlarmsDefaults.append(each)
                
            }
            Alarms.setArrayToDefault(newAlarmsDefaults)
        }
    }
}

// https://stackoverflow.com/a/66788590
extension Encodable {
    
    func toJSONString() -> String {
        let jsonData = try! JSONEncoder().encode(self)
        return String(data: jsonData, encoding: .utf8)!
    }
}

func instantiate<T: Decodable>(jsonString: String) -> T? {
    return try? JSONDecoder().decode(T.self, from: jsonString.data(using: .utf8)!)
}



class Alarms {
    var list: [Alarm] = []
    init() {
        self.list = Alarms.obtainArrayFromDefault()
    }
    
    func remove(at index: Int) {
        list[index].remove()
        list.remove(at: index)
    }
    
    func changeSwitch(at index: Int) {
        list[index].isOn = list[index].isOn ? false : true
        list[index].changeSwitch()
    }
    
    static func obtainArrayFromDefault() -> [Alarm] {
        let fromJson = defaults.string(forKey: "alarmsArrayJson")
        let alarmsList: [Alarm]? = instantiate(jsonString: fromJson ?? "")
        if let alarmsList = alarmsList {
            return alarmsList
        } else {
            return []
        }
    }

    static func setArrayToDefault(_ alarmsDefaults: [Alarm]) {
        let toJson = alarmsDefaults.toJSONString()
        defaults.set(toJson, forKey: "alarmsArrayJson")
    }
}

let defaults = UserDefaults.standard
var alarms: Alarms = Alarms()

class AlarmsListViewController: UIViewController {

    @IBOutlet weak var alarmsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        alarms = Alarms()
        alarmsTableView.frame = self.view.frame
        alarmsTableView.dataSource = self
        alarmsTableView.delegate = self
        
        alarmsTableView.register(UINib(nibName: "AlarmViewCell", bundle: nil), forCellReuseIdentifier: "alarmCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}

extension AlarmsListViewController: UITableViewDataSource {
    
    /// Returns ammount of table rows required for table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.list.count
    }
    
    /// Creates cells for rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmViewCell
        
        // alarm time
        
        
        var timeMinutes: String = "\(alarms.list[indexPath.row].time % 60)"
        if timeMinutes.count < 2 {
            timeMinutes = "0\(timeMinutes)"
        }
        cell.alarmTimeLabel.text = "\(alarms.list[indexPath.row].time / 60):\(timeMinutes)"
        
        // alarm description label
        cell.alarmDescriptionLabel.text = "\(alarms.list[indexPath.row].description)"
        
        // is alarm on
        cell.alarmActiveSwitch.isOn = alarms.list[indexPath.row].isOn
        
        return cell
    }
    
    
}

extension AlarmsListViewController: UITableViewDelegate {
    
    /// Provides changes for editable cell when cell row is pulled to the left
    ///  # Notes: #
    /// editingStyle can be .delete , .insert or .none
    /// removes alarm from the UserDefaults and Alarms list array
    /// reloads data of tableView
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alarms.remove(at: indexPath.row)

            tableView.reloadData()
        }
    }
    
    /// Provides changes when table cell row is selected
    /// # Notes: #
    /// changes switch Boolean value in UserDefaults and Alarms list array
    /// reloads data of tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        alarms.changeSwitch(at: indexPath.row)
        // TODO: pop-up to change alarm
        tableView.reloadData()
    }
}

