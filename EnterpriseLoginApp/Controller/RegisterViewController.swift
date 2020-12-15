//
//  RegisterViewController.swift
//  EnterpriseLoginApp
//
//  Created by namtrinh on 11/12/2020.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassWordTextField: UITextField!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUp()
        dismissKeyboard()
    }
    
    private func setUp(){
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPassWordTextField.delegate = self
//        passwordTextField.isSecureTextEntry = true
//        confirmPassWordTextField.isSecureTextEntry = true
        registerButton.layer.cornerRadius = 15
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.cornerRadius = 15
        usernameTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        confirmPassWordTextField.layer.borderWidth = 1
        confirmPassWordTextField.layer.cornerRadius = 15
        confirmPassWordTextField.layer.borderColor = UIColor.white.cgColor
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.turn.up.left"), style: .plain, target: self, action: #selector(handelBackBarButtonItem))
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(avatarImageTapped(tapGestureRecognizer:)))
        avatarImage.isUserInteractionEnabled = true
        avatarImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func avatarImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }else{
                print("Camera is not valiable!")
            }
        }))
        actionSheet.addAction((UIAlertAction(title: "Photo Library", style: .default, handler: { (UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        })))
        actionSheet.addAction((UIAlertAction(title: "Cancel", style: .default, handler: nil)))
        self.present(actionSheet, animated: true, completion: nil)
        print("Tapped")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        avatarImage.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handelRegisterButton(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty,
            let password = passwordTextField.text, !password.isEmpty,
            let confirmpassword = confirmPassWordTextField.text, !confirmpassword.isEmpty else {
                return
        }
        if password != confirmpassword {
            let alert:UIAlertController = UIAlertController(title: "Those passwords didn't match. Try again.", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert,animated: true, completion: nil)
        }
        else {
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(password, forKey: "password")
            let alert:UIAlertController = UIAlertController(title: "Successfully", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert,animated: true, completion: nil)
        }
        
    }
    
    @IBAction func handelSignInButton(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SignInViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func handelBackBarButtonItem(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension UIViewController {
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        }
        
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
        }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.confirmPassWordTextField.resignFirstResponder()
        return true
    }

}

extension RegisterViewController:  UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
}
