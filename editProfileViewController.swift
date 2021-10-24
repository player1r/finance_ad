//
//  editProfileViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 23.05.2021.
//

import UIKit
import Firebase

class editProfileViewController: UIViewController, UITextFieldDelegate {
    
    let db = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    let datePicker = UIDatePicker()
    let genderPicker = UIPickerView()
    
    func configureTextField(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: x, y: y, width: width, height: height)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.backgroundColor = .clear
        saveButton.layer.cornerRadius = 35
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.white.cgColor
        
        configureTextField(x: 0, y: nameTextField.frame.size.height+5.0, width: nameTextField.frame.size.width, height:1.0, textField: nameTextField)
        nameTextField.delegate = self
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Имя пользователя",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        configureTextField(x: 0, y: emailTextField.frame.size.height+5.0, width: emailTextField.frame.size.width, height:1.0, textField: emailTextField)
        emailTextField.delegate = self
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Электронная почта",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        configureTextField(x: 0, y: dateTextField.frame.size.height+5.0, width: dateTextField.frame.size.width, height:1.0, textField: dateTextField)
        dateTextField.delegate = self
        dateTextField.attributedPlaceholder = NSAttributedString(string: "Дата рождения",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        configureTextField(x: 0, y: genderTextField.frame.size.height+5.0, width: genderTextField.frame.size.width, height:1.0, textField: genderTextField)
        genderTextField.delegate = self
        genderTextField.attributedPlaceholder = NSAttributedString(string: "Пол",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        datePicker.datePickerMode = .date
        dateTextField.inputView = datePicker
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID!)
        datePicker.preferredDatePickerStyle = .wheels
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([flexSpace,doneButton], animated: true)
        dateTextField.inputAccessoryView = toolBar
        // Do any additional setup after loading the view.
        
        
        
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
                let birthday_timestamp = birthday_user as! Timestamp
                
                self.nameTextField.text = name
                self.emailTextField.text = email
                self.genderTextField.text = gender
                
                let date = Date(timeIntervalSince1970: TimeInterval(birthday_timestamp.seconds))
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MM.yyyy"
                self.dateTextField.text = formatter.string(from: date)
                
            }
        }
    }
    @objc func doneAction() {
        getDate()
        view.endEditing(true)
    }
    
    func getDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        dateTextField.text = formatter.string(from: datePicker.date)
    }
    
    @IBAction func editProfile(_ sender: Any) {
        let timestamp = Timestamp(date: datePicker.date)
        let docRef = db.collection("users").document(uid)
        docRef.updateData([
            "name": nameTextField.text!,
            "email": emailTextField.text!,
            "birthday": timestamp,
            "gender": genderTextField.text!
        ])
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
