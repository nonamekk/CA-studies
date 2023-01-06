//
//  RecipeDetailsViewController.swift
//  restaurants_recipes
//
//  Created by nonamekk on 2022-10-20.
//

import UIKit

class RecipeDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setData(data: ResData) {
        imageView.image = data.photo
        nameLabel.text = data.name
        if let description = data.description {
            descriptionLabel.text = description
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ListViewController {
            destination.sendingDataToRecipe = setData
        }
    }
}
