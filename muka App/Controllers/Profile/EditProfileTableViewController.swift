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
        displayCurrentUserDetail();
    }
    
    func displayCurrentUserDetail(){
        guard let userId = receivedData else {
            print("No user ID received.")
            return
        }
        guard let userProfile = user.sampleUsers.first(where: { $0.userId == userId }) else {
            print("User profile not found for ID:", userId)
            return
        }
        nameTextField.text = userProfile.userName
        emailTextField.text = userProfile.userEmail
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveButtonClicked" {
            if let profileTVC = segue.destination as? ProfileTableViewController {
                // Pass data to the destination view controller
                //destinationVC.receivedData = currentUserId
                user.updateUserInfo(userID: receivedData ?? 1, newUserName: nameTextField.text ?? "", newUserEmail: emailTextField.text ?? "")
                profileTVC.viewWillAppear(true)
            }
        }
    }
    
    
}
