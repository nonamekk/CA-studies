//
//  ContactViewCell.swift
//  contacts_list
//
//  Created by Admin on 2022-10-16.
//

import UIKit

class ContactViewCell: UITableViewCell {


    @IBOutlet weak var contactLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
