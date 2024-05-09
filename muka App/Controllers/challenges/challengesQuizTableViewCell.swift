//
//  QuizTableViewCell.swift
//  muka App
//
//  Created by student on 08/05/24.
//

import UIKit

class challengesQuizTableViewCell: UITableViewCell {
    
    @IBOutlet weak var quizIcon: UIImageView!
    @IBOutlet weak var quizTitle: UILabel!
    @IBOutlet weak var quizDescription: UILabel!
    @IBOutlet weak var earnReward: UILabel!
    @IBOutlet weak var difficulty: UILabel!
    @IBOutlet weak var quizScore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
