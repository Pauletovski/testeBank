//
//  loginViewController.swift
//  testSantander
//
//  Created by Paulo Lazarini on 23/05/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var auth:Auth?
    
    var validation:ValidationService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.auth = Auth.auth()
        self.validation = ValidationService(loginViewController: self)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        let email:String = userTextfield.text ?? ""
        let senha:String = passwordTextfield.text ?? ""
        
        validation?.getLogin(email: email, senha: senha)
    }
}
