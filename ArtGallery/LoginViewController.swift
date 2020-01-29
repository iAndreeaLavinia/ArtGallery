//
//  ImageGalleryViewController.swift
//  ArtGallery
//
//  Created by Andreea Lavinia Ionescu on 16/01/2020.
//  Copyright © 2020 Orange Labs Romania. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!

    @IBOutlet weak var mainStackView: UIStackView!
    
    @IBOutlet weak var titleLabel: UILabel!
        
    @IBOutlet weak var usernameTextField: UITextField!
   
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!

    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set the delegate to the current controller
        passwordTextField.delegate = self
    
        // FIXME: - Localize this string
        // Set a placeholder that dissapears while editing
        passwordTextField.placeholder = "Password"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: - Actions
    @IBAction func loginAction(_ sender: UIButton) {
        if usernameTextField.text?.isEmpty ?? true && passwordTextField.text?.isEmpty ?? true {
           
        } else {
           self.dismiss(animated: true, completion: nil)
        }
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}
