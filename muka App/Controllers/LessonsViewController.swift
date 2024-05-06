import UIKit

class LessonsViewController: UIViewController {
    
    @IBOutlet weak var lessonNameLabel: UILabel!
    @IBOutlet weak var lessonImageView: UIImageView!
    @IBOutlet weak var lessonDescriptionLabel: UILabel!
    
    @IBOutlet weak var lessonsCountLabel: UILabel!
    @IBOutlet weak var lessonsCollectionView: UICollectionView!
    
    var lessons: [Lesson] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up lessons
        lessons = [
            Lesson(name: "What is ISL?", image: UIImage(named: "Screenshot 2024-04-26 at 12.28.27 PM")!, description: "Description of Lesson 1", timing: "1:20min"),
            Lesson(name: "Basics of ISL", image: UIImage(named: "Screenshot 2024-04-26 at 12.28.27 PM")!, description: "Description of Lesson 2", timing: "50min"),
            Lesson(name: "Basics of ISL?", image: UIImage(named: "Screenshot 2024-04-26 at 12.28.27 PM")!, description: "Description of Lesson 3", timing: "30min"),
            Lesson(name: "Aphabets Part-1", image: UIImage(named: "Screenshot 2024-04-26 at 12.28.27 PM")!, description: "Description of Lesson 3", timing: "1hr 50min"),
            Lesson(name: "Aphabets Part-2", image: UIImage(named: "Screenshot 2024-04-26 at 12.28.27 PM")!, description: "Description of Lesson 3", timing: "2hr")
        ]
        
        // Update UI
        updateUI()
        
        // Set up collection view
        lessonsCollectionView.delegate = self
        lessonsCollectionView.dataSource = self
    }
    
    func updateUI() {
        // Update UI elements with the first lesson details
        guard let firstLesson = lessons.first else { return }
        lessonNameLabel.text = firstLesson.name
        lessonImageView.image = UIImage(named: "Screenshot 2024-04-26 at 11.26.43 AM")
        lessonDescriptionLabel.text = "\("Introduction to Indian Sign Language") is a specialised course focusing on the unique…"
        
        // Update lessons count label
        lessonsCountLabel.text = "Total Lessons: \(lessons.count)"
    }
}

extension LessonsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LessonCell", for: indexPath) as! LessonCell
        let lesson = lessons[indexPath.item]
        cell.lessonImageView.image = lesson.image
        cell.lessonDescriptionLabel.text = lesson.description
        cell.timingLabel.text = lesson.timing
        return cell
    }
}
