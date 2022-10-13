//
//  InvitedPeopleListViewController.swift
//  Lecture5-Example
//
//  Created by Admin on 2022-10-04.
//

import UIKit

class InvitedPeopleListViewController: UITableViewCell {
    
    @IBOutlet weak var personCalledView: UIView!
    @IBOutlet weak var personNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialize code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

