//
//  profileViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 20.04.2021.
//

import UIKit
import Firebase

class profileViewController: UIViewController {

    func configureTextField(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: x, y: y, width: width, height: height)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }
    
    let db = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    @IBOutlet weak var LogOutButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Фоновый цвет
        navigationController?.navigationBar.barTintColor = UIColor(red: (88/255.0), green: (145/255.0), blue: (255/255.0), alpha: 1)
        
        configureTextField(x: 0, y: emailTextField.frame.size.height+5.0, width: emailTextField.frame.size.width, height:1.0, textField: emailTextField)
        configureTextField(x: 0, y: dateTextField.frame.size.height+5.0, width: dateTextField.frame.size.width, height:1.0, textField: dateTextField)
        configureTextField(x: 0, y: genderTextField.frame.size.height+5.0, width: genderTextField.frame.size.width, height:1.0, textField: genderTextField)
        
        LogOutButton.backgroundColor = .clear
        LogOutButton.layer.cornerRadius = 35
        LogOutButton.layer.borderWidth = 1
        LogOutButton.layer.borderColor = UIColor.white.cgColor
        
        let docRef = db.collection("users").document(uid)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let name_user = document.get("name")
                print("Get info success ")
                let email_user = document.get("email")
                let gender_user = document.get("gender")
                let birthday_user = document.get("birthday")
                
                let name = name_user as! String
                let email = email_user as! String
                let gender = gender_user as! String
                let birthday = birthday_user as! Timestamp
                self.nameLabel.text = name + ",\nэтот раздел о тебе"
                self.emailTextField.text = email
                self.genderTextField.text = gender
                
                let date = Date(timeIntervalSince1970: TimeInterval(birthday.seconds))
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MM.yyyy"

                self.dateTextField.text = formatter.string(from: date)

            } else {
                print("Get name error: Document does not exist")
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    func LogOut(){
        do{
           try Auth.auth().signOut();
         } catch let logOutError {
           print(logOutError)
         }
    }
    
    
    @IBAction func LogOutButton(_ sender: Any) {

        LogOut()
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "loginViewController")

    show(secondVC, sender: self)
      secondVC.navigationItem.setHidesBackButton(true, animated:true)
        secondVC.tabBarController?.tabBar.isHidden = true
        
    }
 
}
