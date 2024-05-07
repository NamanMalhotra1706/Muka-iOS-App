//
//  EditProfileTableViewController.swift
//  muka App
//
//  Created by Student on 07/05/24.
//

import UIKit

class EditProfileTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    var receivedData: Int?

    var profileUpdated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userId = receivedData else {
                    print("No user ID received.")
                    return
                }

                guard let userProfile = User.getAllUser().sampleUsers.first(where: { $0.userId == userId }) else {
                    print("User profile not found for ID:", userId)
                    return
                }

                // Update UI with user profile data
                nameTextField.text = userProfile.userName
                emailTextField.text = userProfile.userEmail
    }
    
    @IBAction func saveChanges(_ sender: UIBarButtonItem) {

        print("Saving the data")
        
        if let userId = receivedData {
            
            User.getAllUser().updateUser(userId: userId, newUserName: nameTextField.text ?? "", newUserEmail: emailTextField.text ?? "")

                profileUpdated = true

                } else {
                    print("No user ID received.")
                }
                
        //print("User new Name: \(nameTextField.text)")
       //print("User new Name: \(emailTextField.text)")
        
        profileUpdated = true
        
        // performSegue(withIdentifier: "saveProfile", sender: self)

        }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 1
    }
    
    
    
}
