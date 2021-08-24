//
//  LoginViewController.swift
//  MedisageTest
//
//  Created by Abhi on 22/08/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var submitBtn: UIButton!
    
    var emailStr = ""
    var passwordStr = ""
    var tapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitBtn.isEnabled = false
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapped() {
        emailStr = emailTF.text!
        passwordStr = passwordTF.text!
        if (Utilities.isValidEmail(emailStr) && Utilities.isPasswordValid(passwordStr)) {
            submitBtn.isEnabled.toggle()
        }
    }
    
    @IBAction func submitTapped(_ sender: UIButton) {
     
        let vc = storyboard!.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
