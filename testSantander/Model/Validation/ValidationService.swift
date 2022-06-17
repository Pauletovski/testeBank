//
//  ValidationService.swift
//  testSantander
//
//  Created by Paulo Lazarini on 15/06/22.
//

import Foundation
import Firebase

class ValidationService {
    
    let auth: Auth?
    let loginViewController:LoginViewController
    
    init(loginViewController: LoginViewController) {
        self.auth = nil
        self.loginViewController = loginViewController
    }
    
    func getLogin (email: String, senha: String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: senha, completion: { (usuario, error) in
            if error != nil{
               print(ValidationError.invalidLogin)
            }else {
                if usuario == nil{
                    print(ValidationError.invalidUser)
                }else {
                    print("Vdd")
                    let viewController = ViewController()
                    self.loginViewController.present(viewController, animated: true)
                }
            }
        }

    )}
    
    enum ValidationError: LocalizedError {
        case invalidUser
        case invalidLogin
        
        var errorDescription: String? {
            switch self {
            case .invalidUser:
                return "Usuário Invalido."
            case .invalidLogin:
                return "Login Falhou."
            }
        }
        
    }
}
