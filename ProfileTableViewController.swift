//
//  ProfileTableViewController.swift
//  Profile
//
//  Created by Student on 07/05/24.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    
    @IBOutlet weak var ProfileBitmogi: UIImageView!
    
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var profileEmail: UILabel!
    
    let currentUserId = 1
    
    //var userProfile: UserProfile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayUserProfile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        displayUserProfile()
    }
    
    func displayUserProfile(){
        if let userProfile = user.sampleUsers.first(where: { $0.userId == currentUserId }) {
            print("User Name: \(userProfile.userName)")
            print("User Email: \(userProfile.userEmail)")
            ProfileBitmogi.image = userProfile.userAvatar
            profileName.text = userProfile.userName
            profileEmail.text = userProfile.userEmail
            
        }
        else {
            print("User not found.")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userIdToEdit" {
            if let navigationController = segue.destination as? UINavigationController,
               let destinationVC = navigationController.topViewController as? EditProfileTableViewController {
                // Pass data to the destination view controller
                destinationVC.receivedData = currentUserId
            }
        }
    }
    
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        
    }
    
    
}

