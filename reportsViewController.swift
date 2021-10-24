//
//  reportsViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 24.05.2021.
//

import UIKit

class reportsViewController: UIViewController {

    @IBOutlet weak var finaceButton: UIButton!
    @IBOutlet weak var balanceButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        
        tabBarController?.tabBar.barTintColor = UIColor(red: (57/255.0), green: (56/255.0), blue: (56/255.0), alpha: 1)
        //Цвет текта в навигации
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
 
        //Фоновый цвет
        navigationController?.navigationBar.barTintColor = UIColor(red: (254/255.0), green: (170/255.0), blue: (0/255.0), alpha: 1)
        //Цвет текта в навигации
        
        finaceButton.backgroundColor = .clear
        finaceButton.layer.cornerRadius = 15
        finaceButton.layer.borderWidth = 1
        finaceButton.layer.borderColor = UIColor.white.cgColor
        
        balanceButton.backgroundColor = .clear
        balanceButton.layer.cornerRadius = 15
        balanceButton.layer.borderWidth = 1
        balanceButton.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
