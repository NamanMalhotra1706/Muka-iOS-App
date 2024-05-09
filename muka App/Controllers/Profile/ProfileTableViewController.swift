//
//  ProfileTableViewController.swift
//  Profile
//
//  Created by Student on 07/05/24.
//

import UIKit
import SafariServices
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
        
        if segue.identifier == "ShowAchievement",
           let achievementVC = segue.destination as? AchievementViewController,
           let user = sender as? UserProfile {
            achievementVC.myUser = user
        }
    }
    
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        
    }
    
    // Function to handle tap on achievement cell
    func handleAchievementCellTap(forUser user: UserProfile) {
        performSegue(withIdentifier: "ShowAchievement", sender: user)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 3 {
            if let url = URL(string: "https://www.freeprivacypolicy.com/live/d6fcbb63-2e69-4d0e-8964-5441f4033995"){
                let privacyPolicyURL = SFSafariViewController(url:url)
                present(privacyPolicyURL,animated: true,completion: nil)
            }
        }
        
        if indexPath.section == 1 && indexPath.row == 2 {
            if let url = URL(string: "https://www.surveymonkey.com/r/L32F5QP"){
                let feedbackFormURL = SFSafariViewController(url:url)
                present(feedbackFormURL,animated: true,completion: nil)
            }
        }
        
        
        
    }
    
    
}

