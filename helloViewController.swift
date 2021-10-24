//
//  helloViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 19.04.2021.
//

import UIKit
import Firebase
import FirebaseFirestore

class helloViewController: UIViewController {

    let db = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let docRef = db.collection("users").document(uid)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let property = document.get("name")
                let name_user = property as! String
                print("Get name success :", name_user)
                self.Label.text = "Привет,\n" + name_user + "!"
            } else {
                print("Get name error: Document does not exist")
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            self.performSegue(withIdentifier: "mainViewController", sender: nil)
            _ = storyBoard.instantiateViewController(identifier: "mainViewController")
            
        }
    }
    

}
