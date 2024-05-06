//
//  ProfileTableViewController.swift
//  muka App
//
//  Created by student on 25/04/24.
//

import UIKit


class ProfileTableViewController: UITableViewController {
    
    //outlets
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    let userProfileService = UserProfileService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch user profile data
                userProfileService.fetchUserProfile { [weak self] userProfile in
                    guard let self = self, let userProfile = userProfile else { return }
                    
                    // Update UI with fetched data
                    self.userImage.image = userProfile.image
                    self.usernameLabel.text = userProfile.name
                }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    

}
