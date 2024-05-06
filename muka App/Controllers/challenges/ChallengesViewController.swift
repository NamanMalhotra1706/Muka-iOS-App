import UIKit

class ChallengesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var currentWeekCollectionView: UICollectionView!
    @IBOutlet weak var quizHistoryCollectionView: UICollectionView!
    
    var currentWeekQuizzes: [ChallengeQuiz] = []
    var quizHistory: [Challenge] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // Load initial data
        loadInitialData()
        
        // Set delegates
        currentWeekCollectionView.delegate = self
        currentWeekCollectionView.dataSource = self
        quizHistoryCollectionView.delegate = self
        quizHistoryCollectionView.dataSource = self
    }
    
    func loadInitialData() {
        // Load initial data for current week and quiz history
        currentWeekQuizzes = loadCurrentWeekQuizzes()
        quizHistory = loadQuizHistory()
        
        // Update UI
        updateProgressView()
    }
    
    func loadCurrentWeekQuizzes() -> [ChallengeQuiz] {
        // Load current week quizzes
        // Sample data
        return [
            ChallengeQuiz(title: "Quiz 1", image: UIImage(named: "Goodbye")!, description: "Description for Quiz 1"),
            ChallengeQuiz(title: "Quiz 2", image: UIImage(named: "Goodbye")!, description: "Description for Quiz 2")
        ]
    }
    
    func loadQuizHistory() -> [Challenge] {
        // Load quiz history
        // Sample data
        return [
            Challenge(title: "Quiz 3", description: "Description for Quiz 3", marksObtained: 80),
            Challenge(title: "Quiz 4", description: "Description for Quiz 4", marksObtained: 70),
            Challenge(title: "Quiz 5", description: "Description for Quiz 5", marksObtained: 90),
            Challenge(title: "Quiz 6", description: "Description for Quiz 6", marksObtained: 85)
        ]
    }
    
    func updateProgressView() {
        // Calculate progress based on marks obtained in quiz history
        let totalMarks = quizHistory.reduce(0) { $0 + $1.marksObtained }
        let totalQuizzes = quizHistory.count
        let averageMarks = totalQuizzes > 0 ? totalMarks / totalQuizzes : 0
        
        let progress = Float(averageMarks) / 100.0
        progressView.setProgress(progress, animated: true)
        
        // Update level label based on progress
        levelLabel.text = "Level: \(calculateLevel(progress))"
    }
    
    func calculateLevel(_ progress: Float) -> Int {
        // Calculate level based on progress
        return Int(progress * 10) + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == currentWeekCollectionView {
            return currentWeekQuizzes.count
        } else if collectionView == quizHistoryCollectionView {
            return quizHistory.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == currentWeekCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentWeekQuizCell", for: indexPath) as! CurrentWeekQuizCell
            let quiz = currentWeekQuizzes[indexPath.item]
            cell.configure(with: quiz)
            return cell
        } else if collectionView == quizHistoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizHistoryCell", for: indexPath) as! QuizHistoryCell
            let challenge = quizHistory[indexPath.item]
            cell.configure(with: challenge)
            return cell
        }
        return UICollectionViewCell()
    }
}
