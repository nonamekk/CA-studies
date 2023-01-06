//
//  SecondPageViewController.swift
//  layouter
//
//  Created by Admin on 2022-10-13.
//

import UIKit

class SecondPageViewController: UIViewController {

    @IBOutlet weak var blackInnerBoxView: UIView!
    @IBOutlet weak var whiteBoxView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewContraints()
        addNewSubview()
        
        func setupViewContraints() {
            
            whiteBoxView.translatesAutoresizingMaskIntoConstraints = false
            
            whiteBoxView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            whiteBoxView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            whiteBoxView.widthAnchor.constraint(equalToConstant: 100).isActive = true
            whiteBoxView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            blackInnerBoxView.translatesAutoresizingMaskIntoConstraints = false
            
            blackInnerBoxView.centerXAnchor.constraint(equalTo: whiteBoxView.centerXAnchor).isActive = true
            blackInnerBoxView.centerYAnchor.constraint(equalTo: whiteBoxView.centerYAnchor).isActive = true
            blackInnerBoxView.widthAnchor.constraint(equalToConstant: 100).isActive = true
            blackInnerBoxView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        
        func addNewSubview() {
            
            let sView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
            sView.backgroundColor = .white
            view.addSubview(sView)
        }
    }
}
