//import UIKit
//
//class AchievementViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
//    
//    @IBOutlet weak var userProfileImageView: UIImageView!
//    @IBOutlet weak var userNameLabel: UILabel!
//    
//    @IBOutlet weak var medalsCollectionView: UICollectionView!
//    @IBOutlet weak var badgesCollectionView: UICollectionView!
//    
//    var medals: [Medal] = []
//    var badges: [Badge] = []
//    
//    
//    let userProfileService = UserProfileService()
//    
//    override func viewDidLoad() {
////        super.viewDidLoad()
//        
//        // Fetch user profile data
//                userProfileService.fetchUserProfile { [weak self] userProfile in
//                    guard let self = self, let userProfile = userProfile else { return }
//                    
//                    // Update UI with fetched data
//                    self.userProfileImageView.image = userProfile.image
//                    self.userNameLabel.text = userProfile.name
//                    
//                }
//        // Set up initial medals and badges
//        medals = [
//            Medal(imageName: "Gold", title: "Gold"),
//            Medal(imageName: "Silver", title: "Silver"),
//            Medal(imageName: "Bronze", title: "Bronze")
//        ]
//
//        badges = [
//            Badge(imageName: "Screenshot 2024-04-25 at 2.28.14 PM", title: "First Badge"),
//            Badge(imageName: "Screenshot 2024-04-25 at 2.28.59 PM", title: "Second Badge")
//        ]
//
//        medalsCollectionView.delegate = self
//        medalsCollectionView.dataSource = self
//
//        badgesCollectionView.delegate = self
//        badgesCollectionView.dataSource = self
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == medalsCollectionView {
//            return medals.count
//        } else {
//            return badges.count
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == medalsCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MedalCell", for: indexPath) as! MedalCell
//            
//            let medal = medals[indexPath.item]
//            cell.imageView.image = UIImage(named: medal.imageName)
//            cell.titleLabel.text = medal.title
//            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BadgeCell", for: indexPath) as! BadgeCell
//            cell.layer.cornerRadius = 10
//            let badge = badges[indexPath.item]
//            cell.imageView.image = UIImage(named: badge.imageName)
//            cell.titleLabel.text = badge.title
//            return cell
//        }
//    }
//}
