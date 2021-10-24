//
//  startViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 07.02.2021.
//

import UIKit
import Firebase

class startViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            if Auth.auth().currentUser != nil {
                
                self.dismiss(animated: false, completion: nil)
                self.performSegue(withIdentifier: "helloViewController", sender: nil)
                _ = storyBoard.instantiateViewController(identifier: "helloViewController")
                
            }
            else {
                
                self.dismiss(animated: false, completion: nil)
                self.performSegue(withIdentifier: "loginViewController", sender: nil)
                _ = storyBoard.instantiateViewController(identifier: "loginViewController")
                
            }
        }
    }
}
