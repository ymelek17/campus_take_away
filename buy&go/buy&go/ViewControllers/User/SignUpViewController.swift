//
//  SignUpViewController.swift
//  buy&go
//
//  Created by aslyy on 12.03.2021.
//

import UIKit

class SignUpViewController: UIViewController{
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    // DATE PICKER
    @IBOutlet weak var DOBTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        toolbar.sizeToFit()
            
        DOBTextField.inputAccessoryView = toolbar
        DOBTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc func donePressed(){
        let form = DateFormatter()
        form.dateStyle = .medium
        form.timeStyle = .none
        
        DOBTextField.text = form.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    //PICKER VIEWS:
    
    @IBOutlet weak var UniversityTextField: UITextField!
    
    @IBOutlet weak var PositionTextField: UITextField!
    
    @IBOutlet weak var GenderTextField: UITextField!
    
    let universitylist = ["Koç Üniversitesi", "BOUN", "ÖzÜ", "İTÜ", "Bilkent Üniversitesi"]
    
    let positionlist = ["Student", "Staff"]
    
    let genderlist = ["Unspecified", "Female", "Male"]
    
    var universityPickerView = UIPickerView()
    var positionPickerView = UIPickerView()
    var genderPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        
        UniversityTextField.inputView = universityPickerView
        UniversityTextField.placeholder = "Select University"
        PositionTextField.inputView = positionPickerView
        PositionTextField.placeholder = "Student or Staff"
        GenderTextField.inputView = genderPickerView
        GenderTextField.placeholder = "Gender"
        
        universityPickerView.delegate = self
        universityPickerView.dataSource = self
        positionPickerView.delegate = self
        positionPickerView.dataSource = self
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        
        // Do any additional setup after loading the view.
        universityPickerView.tag = 1
        positionPickerView.tag = 2
        genderPickerView.tag = 3
    }
    
}

extension SignUpViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return universitylist.count
        case 2:
            return positionlist.count
        case 3:
            return genderlist.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return universitylist[row]
        case 2:
            return positionlist[row]
        case 3:
            return genderlist[row]
        default:
            return "None"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            UniversityTextField.text = universitylist[row]
            UniversityTextField.resignFirstResponder()
        case 2:
            PositionTextField.text = positionlist[row]
            PositionTextField.resignFirstResponder()
        case 3:
            GenderTextField.text = genderlist[row]
            GenderTextField.resignFirstResponder()
        default:
            return
        }
    }
    
    
}
