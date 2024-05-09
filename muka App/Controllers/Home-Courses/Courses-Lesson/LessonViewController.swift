import UIKit
import AVKit
class LessonViewController: UIViewController {
    @IBOutlet weak var courseDescription: UILabel!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var lessonCollectionView: UICollectionView!
    @IBOutlet weak var numberOfLessons: UILabel!
    @IBOutlet weak var totalDuration: UILabel!
    @IBOutlet weak var courseImage: UIImageView!
    
    var selectedCourse: CourseHome?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseImage.contentMode = .scaleToFill
        courseImage.layer.cornerRadius = 20 // Adjust the corner radius as needed
        courseImage.layer.masksToBounds = true // Ensure that the image is clipped to the rounded corners
        
        
        if let course = selectedCourse {
            courseTitle.text = course.courseName
            courseDescription.text = ""
            courseImage.image = course.image
            numberOfLessons.text = "\(course.lessons.count) Videos"
            
        }
        
        lessonCollectionView.delegate = self
        lessonCollectionView.dataSource = self
    }
}


extension LessonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // Two sections: one for lessons, one for assessment button
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return selectedCourse?.lessons.count ?? 0
        } else {
            return 1 // Only one item for the assessment button
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LessonCollectionViewCell", for: indexPath) as! LessonCollectionViewCell
            
            if let lesson = selectedCourse?.lessons[indexPath.item] {
                cell.lessonTitle.text = lesson.lessonTitle
                cell.lessonDuration.text = "\(lesson.lessonDuration) mins"
                cell.lessonImage.image = UIImage(named: "PlayButtonImage")
                // You can set lesson image if available
                // cell.lessonImage.image = ...
            }
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AssessmentButtonCell", for: indexPath) as! AssessmentButtonCell
            cell.takeAssessmentButton.addTarget(self, action: #selector(takeAssessmentButtonTapped), for: .touchUpInside)
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let path = Bundle.main.path(forResource: "Accessibility", ofType: "mp4") else{
            print("video not found")
            return
        }
        
        let player = AVPlayer.init(url: URL(filePath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true){
            player.play()
        }
    }
    
    @objc func takeAssessmentButtonTapped() {
        // Handle "Take Assessment" button tap
        print("Take Assessment button tapped")
    }
}
