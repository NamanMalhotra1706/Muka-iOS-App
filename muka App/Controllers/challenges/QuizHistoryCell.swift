import UIKit

class QuizHistoryCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var marksLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Customize appearance
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.3
        clipsToBounds = false
    }
    
    func configure(with challenge: Challenge) {
        titleLabel.text = challenge.title
        descriptionLabel.text = challenge.description
        marksLabel.text = "\(challenge.progress)/\(challenge.totalMarks)"
        // Configure cell with challenge data
    }
}
