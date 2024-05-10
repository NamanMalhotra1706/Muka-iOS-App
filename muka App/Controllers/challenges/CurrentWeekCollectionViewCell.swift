//
//  CurrentWeekCollectionViewCell.swift
//  muka App
//
//  Created by student on 10/05/24.
//

import UIKit

class CurrentWeekCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
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
