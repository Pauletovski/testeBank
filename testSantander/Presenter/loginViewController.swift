//
//  loginViewController.swift
//  testSantander
//
//  Created by Paulo Lazarini on 23/05/22.
//

import UIKit
import Firebase

class loginViewController: UIViewController {
    
    @IBOutlet weak var userTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var auth:Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.auth = Auth.auth()
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        let email:String = self.userTextfield.text ?? ""
        let senha:String = self.passwordTextfield.text ?? ""
        self.auth?.signIn(withEmail: email, password: senha, completion: { (usuario, error) in
            if error != nil{
                print("Senha ou email errado.")
            }else {
                if usuario == nil{
                    print("Problema no login.")
                }else {
                    let viewController = ViewController()
                    self.present(viewController, animated: true)
                }
            }
        }
)}
}
