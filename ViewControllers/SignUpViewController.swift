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
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var university: UITextField!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var gender: UITextField!
    
    
    @IBAction func signupButton(_ sender: UIButton) {
        user.postUser(email: email.text!, password: password.text!)
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
