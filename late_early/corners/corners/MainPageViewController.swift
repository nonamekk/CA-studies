//
//  MainPageViewController.swift
//  corners
//
//  Created by nonamekk on 2022-10-19.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var viewFigure: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewFigure.layer.cornerRadius = 150

        viewFigure.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
        viewFigure.layer.cornerRadius = viewFigure.frame.width / 2
        viewFigure.layer.borderWidth = viewFigure.frame.height * 2
        addShadow()
    }
    
    func addShadow() {
        viewFigure.layer.shadowRadius = 20
        viewFigure.layer.shadowOpacity = 1
        viewFigure.layer.shadowColor = UIColor.gray.cgColor
        viewFigure.layer.shadowOffset = CGSize(width: 25, height: 25)
        
    }

}
