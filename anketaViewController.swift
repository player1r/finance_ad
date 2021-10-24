//
//  anketaViewController.swift
//  Rich Brain
//
//  Created by Никита Фролов on 25.05.2021.
//

import UIKit

class anketaViewController: UIViewController {
    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var TextField9: UITextField!
    @IBOutlet weak var TextField2: UITextField!
    @IBOutlet weak var TextField3: UITextField!
    @IBOutlet weak var TextField4: UITextField!
    @IBOutlet weak var TextField5: UITextField!
    @IBOutlet weak var TextField6: UITextField!
    @IBOutlet weak var TextField7: UITextField!
    @IBOutlet weak var button: UIButton!
    
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
        
        
    configureTextField(x: 0, y: TextField1.frame.size.height+5.0, width: TextField1.frame.size.width, height:1.0, textField: TextField1)
    TextField1.attributedPlaceholder = NSAttributedString(string: "Ежемесячный доход", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
    configureTextField(x: 0, y: TextField2.frame.size.height+5.0, width: TextField2.frame.size.width, height:1.0, textField: TextField2)
        TextField2.attributedPlaceholder = NSAttributedString(string: "Сумма кредитования", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
    configureTextField(x: 0, y: TextField3.frame.size.height+5.0, width: TextField3.frame.size.width, height:1.0, textField: TextField3)
        TextField3.attributedPlaceholder = NSAttributedString(string: "Срок кредитования (лет)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        
    configureTextField(x: 0, y: TextField4.frame.size.height+5.0, width: TextField4.frame.size.width, height:1.0, textField: TextField4)
        TextField4.attributedPlaceholder = NSAttributedString(string: "Процент (годовой)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
    configureTextField(x: 0, y: TextField5.frame.size.height+5.0, width: TextField5.frame.size.width, height:1.0, textField: TextField5)
        TextField5.attributedPlaceholder = NSAttributedString(string: "Cильно хочешь кредит? Да/Нет", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
    configureTextField(x: 0, y: TextField6.frame.size.height+5.0, width: TextField6.frame.size.width, height:1.0, textField: TextField6)
        TextField6.attributedPlaceholder = NSAttributedString(string: "Даёшь согласие работать 24/7? Да/Нет", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
    configureTextField(x: 0, y: TextField7.frame.size.height+5.0, width: TextField7.frame.size.width, height:1.0, textField: TextField7)
        TextField7.attributedPlaceholder = NSAttributedString(string: "Тебе нравится текущий ритм жизни? Да/Нет", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
  
        
    configureTextField(x: 0, y: TextField9.frame.size.height+5.0, width: TextField9.frame.size.width, height:1.0, textField: TextField9)
            TextField9.attributedPlaceholder = NSAttributedString(string: "Соглашаешься отказаться от отпуска? Да/Нет", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        
        button.backgroundColor = .clear
        button.layer.cornerRadius = 35
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func a1(_ sender: Any) {
        TextField5.text = "Да"
    }
    
    @IBAction func a2(_ sender: Any) {
        TextField6.text = "Да"
    }
    @IBAction func a3(_ sender: Any) {
        TextField7.text = "Да"
    }
    @IBAction func a4(_ sender: Any) {
        TextField9.text = "Да"
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
