//
//  ContactsListViewController.swift
//  contacts_list
//
//  Created by Admin on 2022-10-16.
//

import UIKit

class ContactsListViewController: UIViewController {
    @IBOutlet weak var contactListView: UITableView!
    
    var contactsTupleList = [
        ("Name", "+37012300111"),
        ("Name3", "+37012300123"),
        ("Name2", "+37012300122"),
        ("Name4", "+37012300123"),
        ("Name5", "+37012300223"),
        ("Name6123123123123123123123123112301231231 231", "+37012300100"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactListView.frame = self.view.frame
        contactListView.dataSource = self
        contactListView.delegate = self
        
//        contactListView.rowHeight = UITableView.automaticDimension
//        contactListView.estimatedRowHeight = 82.0
        
        
        contactListView.register(UINib(nibName: "ContactViewCell", bundle: nil), forCellReuseIdentifier: "contactCell")
    }
    
    func saveContact(name: String, phone: String, elementIndex: Int?) {
        if let i = elementIndex {
            self.contactsTupleList[i] = (name, phone)
        } else {
            self.contactsTupleList.append((name, phone))
        }
        self.contactListView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ContactCreationViewController {
            destination.savingContact = saveContact
        }
    }
    
    @objc func updateTable() {
        contactListView.reloadData()
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
    /// removes contact from the array and
    /// reloads data of tableView
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.contactsTupleList.remove(at: indexPath.row)

            tableView.reloadData()
        }
    }
    
    /// Provides changes when table cell row is selected
    /// # Notes: #
    /// Grabs the data from selected cell, performes segue to another view
    /// and sets the data grabbed
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let (name, phone) = self.contactsTupleList[indexPath.row]
        let contactData: ContactData = ContactData(elementIndex: indexPath.row, name: name, phone: phone)
        let contactDict: [String: ContactData] = ["contact_data": contactData]
        
        performSegue(withIdentifier: "saveShowSegue", sender: nil)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "set_contact_data"), object: nil, userInfo: contactDict)
    }
}
