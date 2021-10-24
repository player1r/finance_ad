//
//  passViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 13.06.2021.
//

import UIKit
import FirebaseAuth

class passViewController: UIViewController, UITextFieldDelegate {

    func configureTextField(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: x, y: y, width: width, height: height)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureTextField(x: 0, y: emailTextField.frame.size.height+5.0, width: emailTextField.frame.size.width, height:1.0, textField: emailTextField)
        emailTextField.delegate = self
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Электронная почта",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        passButton.backgroundColor = .clear
        passButton.layer.cornerRadius = 35
        passButton.layer.borderWidth = 1
        passButton.layer.borderColor = UIColor.white.cgColor
        
        // Do any additional setup after loading the view.
    }
    @IBAction func recoverPass(_ sender: Any) {
        let email = emailTextField.text!
        if(!email.isEmpty){
            Auth.auth().sendPasswordReset(withEmail: email) {
                (error) in
                if error == nil {
                    
                    let alert = UIAlertController(title: "Восстановление пароля", message: "Письмо для восстановления пароля отправлено на указанную электронную почту", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
//                        action in
//                        self.navigationController?.popToRootViewController(animated: true)
//                                                    }))
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
//
//                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
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
