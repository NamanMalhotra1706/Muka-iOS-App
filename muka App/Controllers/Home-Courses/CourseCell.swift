import UIKit

class CourseCell: UITableViewCell {
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseIconImageView: UIImageView!
    
    @IBOutlet weak var courseProgressIcon: UIImageView!
    
    @IBOutlet weak var courseStatus: UILabel!
    
    @IBOutlet weak var takeAssessmentButton: UIButton!
    
    //    func configure(with course: CourseHome) {
    //        courseNameLabel.text = course.courseName
    //        courseIconImageView.image = UIImage(named: course.courseIcon)
    //    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
