//
//  ListPeopleViewController.swift
//  Lecture5-Example
//
//  Created by Admin on 2022-10-03.
//

import UIKit

class ListPeopleViewController: UIViewController {
    
    var listOfPeople: [String] = ["Name", "Surname", "TextField"]
    var isAccept: [Bool] = [true, true, false]

    @IBOutlet weak var nameInputTextField: UITextField!
    @IBOutlet weak var tableListView: UITableView!
    
    var nameOfPerson: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableListView.delegate = self
        tableListView.dataSource = self
        
        tableListView.register(UINib(nibName: "tableListViewCell", bundle: nil), forCellReuseIdentifier: "inviteCell")
    }
    
    @IBAction func nameInputEvent(_ sender: Any) {
        nameOfPerson = nameInputTextField.text!
    }
    
    @IBAction func addButtonEvent(_ sender: Any) {
        if nameOfPerson != "" {
            listOfPeople.append(nameOfPerson)
            isAccept.append(1 != 0)
        }
    }

}

extension ListPeopleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPeople.count
    }
    
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: InvitedPeopleListViewController = tableView.dequeueReusableCell(withIdentifier: "invitedPersonCell", for: indexPath) as! InvitedPeopleListViewController
        
        cell.personNameLabel.text = listOfPeople[indexPath.row]
        if isAccept[indexPath.row] {
            cell.personCalledView.backgroundColor = .green
        } else {
            cell.personCalledView.backgroundColor = .red
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listOfPeople.remove(at: indexPath.row)
            isAccept.remove(at: indexPath.row)
            tableListView.reloadData()
        }
    }
    
}

//extension ListPeopleViewController: UITableViewDelegate {
//    func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(listOfPeople[indexPath.row])
//    }
//}
