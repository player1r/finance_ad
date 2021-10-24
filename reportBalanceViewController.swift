//
//  reportBalanceViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 24.05.2021.
//

import UIKit

class reportBalanceViewController: UIViewController, UITextFieldDelegate {

    func configureTextField(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,textField:UITextField)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: x, y: y, width: width, height: height)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }
    
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
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
