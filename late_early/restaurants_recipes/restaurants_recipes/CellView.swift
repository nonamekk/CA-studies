//
//  CellView.swift
//  restaurants_recipes
//
//  Created by nonamekk on 2022-10-20.
//

import UIKit

class CellView: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
