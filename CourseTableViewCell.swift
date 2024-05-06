//
//  CourseTableViewCell.swift
//  muka App
//
//  Created by student on 01/05/24.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    @IBOutlet weak var courseIcon: UIImageView!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseStatus: UILabel!
    @IBOutlet weak var courseProgressIcon: UIImageView!
    
    @IBOutlet weak var takeAssessmentButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
