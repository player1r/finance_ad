//
//  financeReportViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 17.06.2021.
//

import UIKit

class financeReportViewController: UIViewController, UITextFieldDelegate {
    
    func configureTextField(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: x, y: y, width: width, height: height)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }

    //@IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startDateTextField: UITextField!
    
    @IBOutlet weak var endDateTextField: UITextField!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    
    
    //@IBOutlet weak var endDateTextField: UITextField!
    let datePicker = UIDatePicker()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.backgroundColor = .clear
        startButton.layer.cornerRadius = 35
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.white.cgColor
        
        configureTextField(x: 0, y: startDateTextField.frame.size.height+5.0, width: startDateTextField.frame.size.width, height:1.0, textField: startDateTextField)
        startDateTextField.delegate = self
        startDateTextField.attributedPlaceholder = NSAttributedString(string: "Электронная почта",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        configureTextField(x: 0, y: endDateTextField.frame.size.height+5.0, width: endDateTextField.frame.size.width, height:1.0, textField: endDateTextField)
        endDateTextField.delegate = self
        endDateTextField.attributedPlaceholder = NSAttributedString(string: "Электронная почта",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        
        datePicker.datePickerMode = .date
        endDateTextField.inputView = datePicker
        startDateTextField.inputView = datePicker
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID!)
        datePicker.preferredDatePickerStyle = .wheels
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([flexSpace,doneButton], animated: true)
        
        let toolBar1 = UIToolbar()
        toolBar1.sizeToFit()
        let doneButton1 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction1))
        let flexSpace1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar1.setItems([flexSpace1,doneButton1], animated: true)
        
        endDateTextField.inputAccessoryView = toolBar1
        startDateTextField.inputAccessoryView = toolBar
        // Do any additional setup after loading the view.
    }
    @objc func doneAction() {
        getDate()
        view.endEditing(true)
    }
    
    func getDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        startDateTextField.text = formatter.string(from: datePicker.date)
    }
    
    @objc func doneAction1() {
        getDate1()
        view.endEditing(true)
    }
    
    func getDate1() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        endDateTextField.text = formatter.string(from: datePicker.date)
    }

    @IBAction func gen(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let date = formatter.string(from: datePicker.date)
        if (date == "20.04.2021"){
            label1.text = "Финансовый отчёт"
            label1.isHidden = false
            label2.isHidden = false
            label3.isHidden = false
            label4.isHidden = false
            label5.isHidden = false
        }
        else {
            label1.text = "За указанный период данные отсутствуют"
            label1.isHidden = false
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
