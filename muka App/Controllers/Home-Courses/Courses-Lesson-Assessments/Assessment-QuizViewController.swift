import UIKit

class AssessmentQuizViewController: UIViewController {
    
    @IBOutlet weak var imageQuestion: UIImageView!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var nextQuestion: UIButton!
    
    var assessmentQuiz = Quiz()
    var answerButtons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = assessmentQuiz.getProgress()
        
        //answerLabel Hidden First
        answerLabel.isHidden = true
        
        //Nextquestion Button Hidden First
        nextQuestion.isHidden = true
        
        imageQuestion.image = assessmentQuiz.getImage()
        imageQuestion.layer.cornerRadius = 20
        imageQuestion.layer.masksToBounds = true
        
        questionText.text = "Q\(assessmentQuiz.numberQuestion+1). \(assessmentQuiz.getTextQuestion())"
        questionText.textColor = .black
        
        questionNumber.text = "Question \(assessmentQuiz.numberQuestion+1) of \(assessmentQuiz.sampleQuestions.count)"
        
        answerButtons = [option1, option2, option3, option4]
        
        // Customize buttons
        for button in answerButtons {
            button.backgroundColor = .white
            button.layer.cornerRadius = 8
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.gray.cgColor
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        }
    }
    
    @IBAction func userAnswerButton(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text ?? ""
        
        let rightAnswer = assessmentQuiz.checkAnswer(userAnswer: userAnswer)
        
        
        for button in answerButtons {
            if button.titleLabel?.text == assessmentQuiz.sampleQuestions[assessmentQuiz.numberQuestion].options[assessmentQuiz.sampleQuestions[assessmentQuiz.numberQuestion].correctOptionIndex] {
                // Highlight correct answer in green
                button.backgroundColor = .systemGreen
                button.configuration?.baseForegroundColor = UIColor.white
            }
            
            if button == sender {
                button.isUserInteractionEnabled = false
                
                if rightAnswer {
                    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                    button.backgroundColor = .systemGreen
                    button.configuration?.baseForegroundColor = UIColor.white
                } else {
                    button.backgroundColor = .red
                    button.configuration?.baseForegroundColor = UIColor.white
                    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                    let generator = UIImpactFeedbackGenerator(style: .heavy)
                    generator.impactOccurred()
                }
            } else {
                button.isUserInteractionEnabled = false;
            }
        }
        
        answerLabel.isHidden = false
        nextQuestion.isHidden = false
        
    }
    
    @objc func changeQuestion() {
        // Restore button appearance and enable buttons
        for button in answerButtons {
            button.backgroundColor = .white
            button.configuration?.baseForegroundColor = UIColor.black
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            button.isUserInteractionEnabled = true
        }
        
        let question = assessmentQuiz.numberQuestion
        let options = assessmentQuiz.sampleQuestions[question].options
        
        option1.setTitle("\(options[0])", for: .normal)
        option2.setTitle("\(options[1])", for: .normal)
        option3.setTitle("\(options[2])", for: .normal)
        option4.setTitle("\(options[3])", for: .normal)
        
        answerLabel.isHidden = true
        
        nextQuestion.isHidden = true
        
        
        questionText.text = "Q\(assessmentQuiz.numberQuestion+1). \(assessmentQuiz.getTextQuestion())"
        questionText.textColor = .black
        
        questionNumber.text = "Question \(assessmentQuiz.numberQuestion+1) of \(assessmentQuiz.sampleQuestions.count)"
        
        imageQuestion.image = assessmentQuiz.getImage()
        progressBar.progress = assessmentQuiz.getProgress()
    }
    
    
    @IBAction func moveToNextQuestion(_ sender: UIButton) {
        
        if assessmentQuiz.nextQuestion() {
            
            let alert = UIAlertController(title: "Score: \(assessmentQuiz.score)", message: "Do you want to try again?", preferredStyle: .alert)
            
            let yesAction = UIAlertAction(title: "Yes", style: .default){
                _ in
                self.assessmentQuiz.score = 0
                
                Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.changeQuestion), userInfo: nil, repeats: false)
                
            }
            
            let noAction = UIAlertAction(title: "No", style: .cancel) { _ in
                self.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(yesAction)
            alert.addAction(noAction)
            
            present(alert, animated: true)
        } else {
            // Move to the next question after a delay
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeQuestion), userInfo: nil, repeats: false)
        }
    }
}


