//
//  RegisterViewController.swift
//  EnterpriseLoginApp
//
//  Created by ThangLai on 12/12/2 Reiwa.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    
    @IBOutlet weak var userNameTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var confirmPasswordTextField: CustomTextField!
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var btnAvatar: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        passwordTextField.isSecureTextEntry = true
//        confirmPasswordTextField.isSecureTextEntry = true
        avatarImgView.layer.cornerRadius = avatarImgView.frame.height/2
        avatarImgView.isHidden = true
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
//        UserDefaults.standard.removeObject(forKey: "username")
//        UserDefaults.standard.removeObject(forKey: "password")
//        print(UserDefaults.standard.dictionaryRepresentation())
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func registerAccountPressed(_ sender: Any) {
        if checkValidFields() {
            
        } else {
            
        }
        
    }
    
    private func checkValidFields() -> Bool {
        if (userNameTextField.text ?? "").isEmpty || (userNameTextField.text ?? "").isEmpty || (userNameTextField.text ?? "").isEmpty {
            let alert = UIAlertController(title: "Error", message: "Invalid Register", preferredStyle: .alert)
            let successAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            let failAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            alert.addAction(successAction)
            alert.addAction(failAction)
            self.present(alert, animated: true, completion: nil)
        }
        else if passwordTextField.text != confirmPasswordTextField.text  {
            let alert = UIAlertController(title: "Error", message: "Password are not matched", preferredStyle: .alert)
            let successAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            let failAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(successAction)
            alert.addAction(failAction)
            self.present(alert, animated: true, completion: nil)

        }
        else {
            UserDefaults.standard.set(userNameTextField.text, forKey: "username")
            UserDefaults.standard.set(passwordTextField.text, forKey: "password")
            let alert = UIAlertController(title: "Suceesfully", message: "Create account Succesfully", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        return true
    }
    
    @IBAction func signInPressed(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.navigationController?.pushViewController(vc, animated: true)
//        self.show(vc, sender: self)
        
    }
}

extension RegisterViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.userNameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.confirmPasswordTextField.resignFirstResponder()
        return true
    }
}

extension RegisterViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBAction func btnAvaterClicked() {
        let imagePickerController = UIImagePickerController()
            imagePickerController.allowsEditing = false
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
            
    }
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        self.btnAvatar.isHidden = true
        self.avatarImgView.isHidden = false
        self.avatarImgView.contentMode = .scaleAspectFill
        self.avatarImgView.image = selectedImage
        self.dismiss(animated: true, completion: nil)
       }


}
