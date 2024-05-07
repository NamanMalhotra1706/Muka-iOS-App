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
    
    let currentUserId = 2
    let user = User()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userProfile = user.sampleUsers.first(where: { $0.userId == currentUserId }) {
            print("User Name: \(userProfile.userName)")
            print("User Email: \(userProfile.userEmail)")
            ProfileBitmogi.image = userProfile.userAvatar
            profileName.text = userProfile.userName
            profileEmail.text = userProfile.userEmail
            
        } else {
                   print("User not found.")
               }
    }

    
    
    






    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
