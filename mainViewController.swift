//
//  mainViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 15.02.2021.
//

import UIKit
import Firebase

class mainViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        //Фоновый цвет
        navigationController?.navigationBar.barTintColor = UIColor(red: (31/255.0), green: (241/255.0), blue: (60/255.0), alpha: 1)
        // Шрифт title NC
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    
}
