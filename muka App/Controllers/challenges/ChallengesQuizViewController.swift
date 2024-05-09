//
//  ChallengesQuizViewController.swift
//  muka App
//
//  Created by student on 26/04/24.
//

import UIKit

class ChallengesQuizViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var textYourPicture: UILabel!
    @IBOutlet weak var PostingImage: UIImageView!
    @IBOutlet weak var NoteText: UILabel!
    @IBOutlet weak var Note: UILabel!
    
    @IBOutlet weak var nextQuestion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = challenges.getProgress()
        
        questionText.text = "Q\(challenges.questionNumber+1). \(challenges.getTextQuestion())"
        questionText.textColor = UIColor.black
        
        questionNumber.text = "Question \(challenges.questionNumber+1) of \(challenges.sampleQuestionsChallanges.count)"
        
    }
    
    @IBAction func moveToNextQuestion(_ sender: UIButton) {
        
        if challenges.nextQuestion(){
            let alert = UIAlertController(title: "Score: \(challenges.challengesScore)", message: "Do you want to try again?", preferredStyle: .alert)
            
            let yesAction = UIAlertAction(title: "Yes", style: .default){
                _ in
                challenges.challengesScore = 0
                
                Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.changeQuestion), userInfo: nil, repeats: false)
                
            }
            
            let noAction = UIAlertAction(title: "No", style: .cancel) { _ in
                self.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(yesAction)
            alert.addAction(noAction)
            
            present(alert, animated: true)
        } else {
            // Move to the next question after a delay
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeQuestion), userInfo: nil, repeats: false)
        }
    }
    
    @objc func changeQuestion() {
        progressBar.progress = challenges.getProgress()
        
        questionText.text = "Q\(challenges.questionNumber+1). \(challenges.getTextQuestion())"
        questionText.textColor = UIColor.black
        
        questionNumber.text = "Question \(challenges.questionNumber+1) of \(challenges.sampleQuestionsChallanges.count)"
    }
    
    
    
    @IBAction func cameraButtonClicked(_ sender: UIButton) {
        let alertControler = UIAlertController(title:"Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        // Cancel Action
        let cancelAction = UIAlertAction(title: "Cancel",style: .cancel, handler: nil)
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        //Camera Action
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title:"Camera", style:.default, handler:{
                action in imagePicker.sourceType = .camera
                
                self.present(imagePicker,animated: true,completion: nil)
            })
            
            alertControler.addAction(cameraAction)
        }
        
        // Ading actions to Controllers
        alertControler.addAction(cancelAction)
        
        
        
        present(alertControler,animated: true,completion: nil)
    }
    
    
}
