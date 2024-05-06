import UIKit

class LessonsViewController: UIViewController {
    
    @IBOutlet weak var lessonNameLabel: UILabel!
    @IBOutlet weak var lessonImageView: UIImageView!
    @IBOutlet weak var lessonDescriptionLabel: UILabel!
    
    @IBOutlet weak var lessonsCountLabel: UILabel!
    @IBOutlet weak var lessonsCollectionView: UICollectionView!
    
    var selectedCourse: CourseHome?
    var lessons: [CourseHome] = CourseDataModel().getAllCourses()
    
    override func viewDidLoad() {
        //        super.viewDidLoad()
        //
        //        guard let selectedCourse = selectedCourse else {
        //            return
        //        }
        //
        //       // lessons = generateLessons(for: selectedCourse)
        //
        //        updateUI(with: selectedCourse)
        //
        //        lessonsCollectionView.delegate = self
        //        lessonsCollectionView.dataSource = self
    }
}
    
    
    
//    func updateUI(with course: CourseHome) {
//       
//        lessonNameLabel.text = course.courseName
//    
//        lessonsCountLabel.text = "\(lessons.count) Lessons"
//        lessonImageView.image = course.image
//    }

//extension LessonsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LessonCell", for: indexPath) as! LessonCell
//        let lesson = lessons[indexPath.item]
//        cell.lessonImageView.image = UIImage(named: "")
//        cell.timingLabel.text = "\(lesson.lessons[indexPath.row].lessonDuration) min"
//        
//        
//        return cell
//    }

