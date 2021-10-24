//
//  registrationViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 24.01.2021.
//

import UIKit
import Firebase

class registrationViewController: UIViewController {
    
    func configureTextField(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: x, y: y, width: width, height: height)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }
    
    var signUp:Bool = true
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        configureTextField(x: 0, y: nameField.frame.size.height+5.0, width: nameField.frame.size.width, height:1.0, textField: nameField)
        nameField.attributedPlaceholder = NSAttributedString(string: "Имя пользователя",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        configureTextField(x: 0, y: emailField.frame.size.height+5.0, width: emailField.frame.size.width, height:1.0, textField: emailField)
        emailField.attributedPlaceholder = NSAttributedString(string: "Электронная почта",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        configureTextField(x: 0, y: passwordField.frame.size.height+5.0, width: passwordField.frame.size.width, height:1.0, textField: passwordField)
        passwordField.attributedPlaceholder = NSAttributedString(string: "Пароль",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
 
    @IBAction func goToLogin(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

extension registrationViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let name = nameField.text!
        let email = emailField.text!
        let password = passwordField.text!
        
        if(signUp){
            if(!name.isEmpty && !email.isEmpty && !password.isEmpty) {
                Auth.auth().createUser(withEmail: email, password: password) {(result,error) in
                    if error == nil {
                        if let result = result {
                            print(result.user.uid)
                            
                            let db = Firestore.firestore()
                            db.collection("users").document(result.user.uid).setData([
                                "name": name,
                                "email": email,
                                "gender": "мужской",
                                "birthday": NSDate(),
                                "create_date": NSDate(),
                                "status": "1"
                            ]) { err in
                                if let err = err {
                                    print("Error writing document: \(err)")
                                } else {
                                    print("Document successfully written!")
                                }
                            }
                            
//                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                            let newViewController = storyBoard.instantiateViewController(identifier: "firstTimeViewController")
//                            newViewController.modalPresentationStyle = .fullScreen
//                            self.present(newViewController, animated: true, completion: nil)
                            self.view.endEditing(true)
                            self.titleLabel.isHidden = true
                            self.nameField.isHidden = true
                            self.emailField.isHidden = true
                            self.passwordField.isHidden = true
                            
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                                let newViewController = storyBoard.instantiateViewController(identifier: "mainViewController")
//                                newViewController.modalPresentationStyle = .fullScreen
//                                self.present(newViewController, animated: true, completion: nil)
//                                //dismiss
                                
                                
                                
                                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                self.performSegue(withIdentifier: "helloViewController", sender: nil)
                                _ = storyBoard.instantiateViewController(identifier: "helloViewController")
                            }
                        }
                    }
                }
            } else {
                showAlert()
            }
//        } else {
//            if(!email.isEmpty && !password.isEmpty) {
//
//            } else {
//                showAlert()
//            }
        }
        
        return true
    }
}
