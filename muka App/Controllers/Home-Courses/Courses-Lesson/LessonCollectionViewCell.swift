//
//  LessonCollectionViewCell.swift
//  muka App
//
//  Created by student on 07/05/24.
//

import UIKit

class LessonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lessonTitle: UILabel!
    @IBOutlet weak var lessonDuration: UILabel!
    @IBOutlet weak var lessonImage: UIImageView!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
        // Customize appearance
        layer.cornerRadius = 20
//            layer.shadowColor = UIColor.black.cgColor
//            layer.shadowOffset = CGSize(width: 0, height: 2)
//            layer.shadowOpacity = 0.3
        clipsToBounds = false
        }
    
}
