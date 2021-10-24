//
//  newOperationViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 24.05.2021.
//

import UIKit

class newOperationViewController: UIViewController, UITextFieldDelegate {
    
    func configureTextField(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: x, y: y, width: width, height: height)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }

    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.backgroundColor = .clear
        saveButton.layer.cornerRadius = 35
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.white.cgColor
        
        configureTextField(x: 0, y: typeTextField.frame.size.height+5.0, width: typeTextField.frame.size.width, height:1.0, textField: typeTextField)
        typeTextField.delegate = self
        typeTextField.attributedPlaceholder = NSAttributedString(string: "Тип",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        configureTextField(x: 0, y: priceTextField.frame.size.height+5.0, width: priceTextField.frame.size.width, height:1.0, textField: priceTextField)
        priceTextField.delegate = self
        priceTextField.attributedPlaceholder = NSAttributedString(string: "Стоимость",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        configureTextField(x: 0, y: dateTextField.frame.size.height+5.0, width: dateTextField.frame.size.width, height:1.0, textField: dateTextField)
        dateTextField.delegate = self
        dateTextField.attributedPlaceholder = NSAttributedString(string: "Дата реализации",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
