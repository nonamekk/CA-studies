//
//  SecondPageViewController.swift
//  corners
//
//  Created by nonamekk on 2022-10-19.
//

import UIKit

class SecondPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createStartingView()
    }
    
    func createStartingView() {
        
    }

    
    func roundViews(view: UIView) {
        view.layer.cornerRadius = 150
    }
    
    func createNextView(startingView: UIView) {
        // considering startingView is 300x300
        // first view after starting should be 50px diff
        // second view after first should be 25px diff
        // there should be 10 views in total
        switch startingView.frame.size.width {
        case 300:
//            let newView=UIView(frame: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
            break
        case 50...250:
            break
        default:
            break
        }
    }
    
}
