import UIKit

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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(selectedCourse)
        return (selectedCourse?.lessons.count ?? 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LessonCollectionViewCell", for: indexPath) as! LessonCollectionViewCell
        
        if let lesson = selectedCourse?.lessons[indexPath.item] {
            cell.lessonTitle.text = lesson.lessonTitle
            cell.lessonDuration.text = "\(lesson.lessonDuration) mins"
            cell.lessonImage.image = UIImage(named: "PlayButtonImage")!
            // You can set lesson image if available
            // cell.lessonImage.image = ...
        }
        
        return cell
        
        
            }
    @objc func takeAssessmentButtonTapped() {
            // Handle "Take Assessment" button tap
            print("Take Assessment button tapped")
        }
}
