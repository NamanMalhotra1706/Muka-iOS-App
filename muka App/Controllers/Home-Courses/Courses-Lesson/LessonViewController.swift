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
    var currentUser: Int?
    
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
        if indexPath.section == 0 {
            // Get the selected lesson
            guard let lesson = selectedCourse?.lessons[indexPath.item], let currentUser = currentUser else {
                print("Lesson not found or current user not set")
                return
            }
            
            // Check if the lesson title has been clicked before
            let lessonTitle = lesson.lessonTitle
            if let path = Bundle.main.path(forResource: lessonTitle, ofType: "mp4") {
                // Initialize AVPlayer with the video URL
                let player = AVPlayer(url: URL(fileURLWithPath: path))
                
                // Initialize AVPlayerViewController
                let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                
                // Present the player view controller
                present(playerViewController, animated: true) {
                    // Start playing the video
                    player.play()

                    
                    guard !LessonManager.clickedLessonTitles.contains(lessonTitle) else {
                                print("Lesson already clicked")
                                return
                            }
            
            // Print the lesson title to the console
            print("Selected lesson title:", lessonTitle)
    
                                
                    // Update user's completed videos count
                    if let currentCourseID = self.selectedCourse?.courseId {
                        let previousCount = user.getUserCompletion(for: currentUser, courseID: currentCourseID)
                        print("User's completed videos count before update: \(previousCount)")
                        user.updateUserCompletedVideos(for: currentUser, courseID: currentCourseID, numberOfVideosCompleted: 1)
                        print("User's completed videos count after update: \(user.getUserCompletion(for: currentUser, courseID: currentCourseID))")
                        
                        // Add the lesson title to the clickedLessonTitles set
                        LessonManager.clickedLessonTitles.insert(lessonTitle)
                    }
                }
            } else {
                print("Video not found for lesson:", lessonTitle)
            }
        }
    }
    
    @objc func takeAssessmentButtonTapped() {
        // Handle "Take Assessment" button tap
        print("Take Assessment button tapped")
    }
}

