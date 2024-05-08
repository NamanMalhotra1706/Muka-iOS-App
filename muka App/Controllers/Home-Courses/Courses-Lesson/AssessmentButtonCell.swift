import UIKit

class AssessmentButtonCell: UICollectionViewCell {
    @IBOutlet weak var takeAssessmentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Customize button appearance if needed
        clipsToBounds = false
    }

}
