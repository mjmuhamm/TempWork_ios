//
//  CompanyViewController.swift
//  TempWork
//
//  Created by Malik Muhammad on 10/16/23.
//

import UIKit

import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_FilledTextAreasTheming
import MaterialComponents.MaterialTextControls_FilledTextFieldsTheming
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

import MaterialComponents.MaterialButtons
import MaterialComponents

class CompanyLoginViewController: UIViewController {

    @IBOutlet var emailText: MDCOutlinedTextField!
    @IBOutlet var passwordText: MDCOutlinedTextField!
    
    @IBOutlet var loginButton: MDCButton!
    @IBOutlet var forgottenPasswordButton: UIButton!
    
    @IBOutlet var signUpButton: MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        emailText.setOutlineColor(UIColor.systemGray4, for: .normal)
        emailText.setOutlineColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .editing)
        emailText.setTextColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        emailText.setTextColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .editing)

        emailText.setNormalLabelColor(UIColor.systemGray4, for: .normal)
        emailText.setFloatingLabelColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .editing)

        passwordText.setOutlineColor(UIColor.lightGray, for: .normal)
        passwordText.setOutlineColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .editing)
        passwordText.setTextColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        passwordText.setTextColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .editing)

        passwordText.setNormalLabelColor(UIColor.systemGray4, for: .normal)
        passwordText.setFloatingLabelColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .editing)

        emailText.label.text = "Email"
        emailText.placeholder = "Email"

        loginButton.applyOutlinedTheme(withScheme: globalContainerScheme())
        loginButton.layer.cornerRadius = 2

        passwordText.label.text = "Password"
        passwordText.placeholder = "Password"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

    @IBAction func loginButtonPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompanyTab") as! UITabBarController
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
    }
    
}
