//
//  LoginViewController.swift
//  buy&go
//
//  Created by aslyy on 12.03.2021.
//

import UIKit

class LoginViewController: UIViewController {

    let user = RequestUser()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        user.AuthenticateUser(email: email.text!, password: password.text!)
        if(user.auth == true){
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let destinationViewController = storyboard.instantiateViewController(identifier: "StoreViewController") as? FifthViewController
            else { return }
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
