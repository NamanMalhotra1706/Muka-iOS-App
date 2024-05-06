import UIKit

class CurrentWeekQuizCell: UICollectionViewCell {
    
    @IBOutlet weak var quizImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            // Customize appearance
            layer.cornerRadius = 10
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.3
            clipsToBounds = false
        }
    
    func configure(with quiz: ChallengeQuiz) {
        titleLabel.text = quiz.title
        quizImageView.image = quiz.image
        // Configure cell with quiz data
    }
}
