import UIKit

class MedalCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Customize appearance
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true
        
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        // How blurred the shadow is
        layer.shadowRadius = 8.0
        
        // The color of the drop shadow
        layer.shadowColor = UIColor.black.cgColor
        
        // How transparent the drop shadow is
        layer.shadowOpacity = 0.10
        
        // How far the shadow is offset from the UICollectionViewCell’s frame
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
        
}
