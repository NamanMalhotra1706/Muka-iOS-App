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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
