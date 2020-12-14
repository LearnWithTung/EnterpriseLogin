//
//  SignInViewController.swift
//  EnterpriseLoginApp
//
//  Created by namtrinh on 11/12/2020.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        setUp()
        dismissKeyboard()
    }
    
    fileprivate func setUp() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        signinButton.layer.cornerRadius = 15
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.cornerRadius = 15
        usernameTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 15
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.turn.up.left"), style: .plain, target: self, action: #selector(handelBackBarButtonItem))
        
    }
    
    
    @objc private func handelBackBarButtonItem(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func handelRegisterButton(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "RegisterViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func handelSiginButton(_ sender: Any) {
        
    }
    
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        return true
    }

}
