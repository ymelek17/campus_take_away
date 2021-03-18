//
//  SignUpViewController.swift
//  buy&go
//
//  Created by aslyy on 12.03.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    
    let user = RequestUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var universityText: UITextField!
    @IBOutlet weak var typeText: UITextField!
    @IBOutlet weak var dateOfBirthText: UITextField!
    @IBOutlet weak var genderText: UITextField!
    

    @IBAction func signupButton(_ sender: UIButton) {
        let cust = RequestUser.Customer(firstName: firstNameText.text!, lastName: lastNameText.text!, email: emailText.text!, password: passwordText.text!, phoneNumber: phoneNumberText.text!, university: universityText.text!, type: typeText.text!, dateOfBirth: dateOfBirthText.text!, gender: genderText.text!)
        user.signUp(customer: cust)
        if(user.signup == true){
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let destinationViewController = storyboard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
            else { return  }
            //navigationController?.pushViewController(destinationViewController, animated: true)
            present(destinationViewController, animated: true, completion: nil)
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
