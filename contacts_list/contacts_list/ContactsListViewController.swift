//
//  ContactsListViewController.swift
//  contacts_list
//
//  Created by Admin on 2022-10-16.
//

import UIKit

var contactsTupleList = [
    ("Name", "+37012300111"),
    ("Name3", "+37012300123"),
    ("Name2", "+37012300122"),
    ("Name4", "+37012300123"),
    ("Name5", "+37012300223"),
    ("Name6", "+37012300100"),
]

class ContactsListViewController: UIViewController {
    @IBAction func refreshNavButton(_ sender: Any) {
        contactListView.reloadData()
    }
    
    @IBOutlet weak var contactListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactListView.frame = self.view.frame
        contactListView.dataSource = self
        contactListView.delegate = self
        
        contactListView.register(UINib(nibName: "ContactViewCell", bundle: nil), forCellReuseIdentifier: "contactCell")
    }

}

extension ContactsListViewController: UITableViewDataSource {
    /// Returns ammount of table rows required for table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsTupleList.count
    }
    
    /// Creates cells for rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactViewCell
        
        (cell.nameLabel.text, cell.phoneLabel.text) = contactsTupleList[indexPath.row]
        
        return cell
    }
}

extension ContactsListViewController: UITableViewDelegate {
    /// Provides changes for editable cell when cell row is pulled to the left
    ///  # Notes: #
    /// editingStyle can be .delete , .insert or .none
    /// removes alarm from the UserDefaults and Alarms list array
    /// reloads data of tableView
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contactsTupleList.remove(at: indexPath.row)

            tableView.reloadData()
        }
    }
}
