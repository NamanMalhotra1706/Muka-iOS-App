//
//  BadgeCell.swift
//  muka App
//
//  Created by student on 29/04/24.
//

import UIKit

class BadgeCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            // Customize appearance
            layer.cornerRadius = 10
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.3
            clipsToBounds = false
        }
}
