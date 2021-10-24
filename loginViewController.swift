//
//  loginViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 08.02.2021.
//

import UIKit
import Firebase

class loginViewController: UIViewController {
    
    
    func configureTextField(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: x, y: y, width: width, height: height)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }
    
    var signIn:Bool = true

    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Фоновый цвет
        navigationController?.navigationBar.barTintColor = UIColor(red: (88/255.0), green: (145/255.0), blue: (255/255.0), alpha: 1)
        //Цвет текта в навигации
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let newFont = UIFont(name: "Avenir Next", size: 16.0)!
        let color = UIColor.white

        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.classForCoder() as! UIAppearanceContainer.Type]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: newFont], for: .normal)
        
        self.Label.text = "Привет,\nс возвращением!"
        
        configureTextField(x: 0, y: loginTextField.frame.size.height+5.0, width: loginTextField.frame.size.width, height:1.0, textField: loginTextField)
        loginTextField.delegate = self
        loginTextField.attributedPlaceholder = NSAttributedString(string: "Электронная почта",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        
        configureTextField(x: 0, y: passwordTextField.frame.size.height+5.0, width: passwordTextField.frame.size.width, height:1.0, textField: passwordTextField)
        passwordTextField.delegate = self
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}

extension loginViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        
            if(!login.isEmpty && !password.isEmpty) {
                
                Auth.auth().signIn(withEmail: login, password: password) { (user, error) in
                   if error == nil {
                    print("User successfully login!")
                    
                  
//                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                            let newViewController = storyBoard.instantiateViewController(identifier: "helloViewController")
//                            newViewController.modalPresentationStyle = .fullScreen
//                            self.present(newViewController, animated: true, completion: nil)
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    self.performSegue(withIdentifier: "helloViewController", sender: nil)
                    _ = storyBoard.instantiateViewController(identifier: "helloViewController")
                        
                   } else {
                        let alert = UIAlertController(title: "Ошибка!", message: "Пользователь с указанным логином и паролем не найден", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                   }
                }
            } else {
                showAlert()
            }
        
    
        return true
    }
}
