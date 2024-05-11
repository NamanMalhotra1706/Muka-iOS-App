//
//  LoginViewController.swift
//  muka App
//
//  Created by student on 10/05/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    var isChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func checkBoxButtonTapped(_ sender: Any) {
        checkBoxButton.isSelected = !checkBoxButton.isSelected
        
        if !checkBoxButton.isSelected {
            print("Button is deselected") // Check if this prints
            checkBoxButton.setImage(UIImage(), for: .normal) // Set an empty UIImage
        } else {
            print("Button is selected")
            checkBoxButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        }
        
    }
    
    @IBAction func createAccount(_ sender: Any) {
        guard let username = userName.text, !username.isEmpty,
              let email = userEmail.text, !email.isEmpty,
              let password = userPassword.text, !password.isEmpty else {
            // If any field is empty, show an alert
            showAlert(message: "Please fill in all required fields.")
            return
        }
        
        // Check if email is in valid format
        if !isValidEmail(email) {
            showAlert(message: "Please enter a valid email address.")
            return
        }
        
        // Check if password meets complexity requirements
        if !isPasswordValid(password) {
            showAlert(message: "Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.")
            return
        }
        
        print("Username: \(username)")
        print("Email: \(email)")
        print("Password: \(password)")
    }
    
    func isValidEmail(_ email: String) -> Bool {
        // Regular expression to validate email format
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    
    
    func isPasswordValid(_ password: String) -> Bool {
        // Regular expression to validate password format
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    func showAlert(message: String) {
        let attributedTitle = NSAttributedString(string: "Alert", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.red
        ])
        
        let attributedMessage = NSAttributedString(string: message, attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ])
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.setValue(attributedTitle, forKey: "attributedTitle")
        alert.setValue(attributedMessage, forKey: "attributedMessage")
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
