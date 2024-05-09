//
//  TakeChallenegeViewController.swift
//  muka App
//
//  Created by student on 09/05/24.
//

import UIKit

class TakeChallenegeViewController: UIViewController {
    
    var recievedChallenegeName : String?
    var recievedChallenegeDescription: String?
    var recievedChallengeImage: UIImage?
    
    @IBOutlet weak var challengeImage: UIImageView!
    @IBOutlet weak var challenegeName: UILabel!
    @IBOutlet weak var challenegeDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayChallengesData()
    }
    
    func displayChallengesData(){
        challenegeName.text = recievedChallenegeName ?? ""
        
        challenegeDescription.text = recievedChallenegeDescription ?? ""
        
        challengeImage.image = recievedChallengeImage
        
    }
    
    
}
