import UIKit

class AchievementViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Outlets for UI elements
    @IBOutlet weak var badgesCollectionView: UICollectionView!
    @IBOutlet weak var medalsCollectionView: UICollectionView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    // Variable to hold user's data
    var myUser = user.getUserInfo(userID: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update UI elements with user's data
        updateUserInterface()
        
        badgesCollectionView.delegate = self
        badgesCollectionView.dataSource = self
        
        medalsCollectionView.delegate = self
        medalsCollectionView.dataSource = self
    }
    
    // Method to update UI elements with user's data
    func updateUserInterface() {
        
        usernameLabel.text = myUser?.userName
        
        profileImageView.image = myUser?.userAvatar
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == badgesCollectionView {
            return myUser?.completedCourses.count ?? 0
        } else if collectionView == medalsCollectionView {
            return myUser?.completedCourses.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == badgesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "badgeCell", for: indexPath) as! BadgeCell
            if let badge = myUser?.completedCourses[indexPath.item].badgesEarned {
                cell.imageView.image = badge.imageName
                cell.titleLabel.text = badge.title
            }
            return cell
        } else if collectionView == medalsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "medalCell", for: indexPath) as! MedalCell
            if let medal = myUser?.completedCourses[indexPath.item].badgesEarned {
                cell.imageView.image = medal.imageName
                cell.titleLabel.text = medal.title
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
}
