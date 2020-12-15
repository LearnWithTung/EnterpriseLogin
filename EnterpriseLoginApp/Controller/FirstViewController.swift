//
//  FirstViewController.swift
//  EnterpriseLoginApp
//
//  Created by namtrinh on 11/12/2020.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        stackView.layer.cornerRadius = 15
        registerButton.layer.cornerRadius = 15
        signInButton.layer.cornerRadius = 15
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func handelRegisterButton(_ sender: Any) {
        
    }
    
    @IBAction func handelSignInButton(_ sender: Any) {
        
    }
    
}
