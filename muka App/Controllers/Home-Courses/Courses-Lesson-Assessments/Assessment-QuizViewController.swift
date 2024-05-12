import UIKit

/// ViewController for displaying and managing an assessment quiz.
class AssessmentQuizViewController: UIViewController {
    
    // MARK: - Outlets
    
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
    
    // MARK: - Properties
    
    var assessmentQuiz = Quiz() // Instance of the Quiz model
    var answerButtons: [UIButton] = [] // Array to hold answer buttons
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set initial progress
        progressBar.progress = assessmentQuiz.getProgress()
        
        // Hide answerLabel and nextQuestion buttons initially
        answerLabel.isHidden = true
        nextQuestion.isHidden = true
        
        // Set up question image and text
        imageQuestion.image = assessmentQuiz.getImage()
        imageQuestion.layer.cornerRadius = 20
        imageQuestion.layer.masksToBounds = true
        questionText.text = "Q\(assessmentQuiz.numberQuestion+1). \(assessmentQuiz.getTextQuestion())"
        questionText.textColor = .black
        questionNumber.text = "Question \(assessmentQuiz.numberQuestion+1) of \(assessmentQuiz.sampleQuestions.count)"
        
        // Assign answer buttons to array for easy management
        answerButtons = [option1, option2, option3, option4]
        
        // Customize answer buttons
        for button in answerButtons {
            button.backgroundColor = .white
            button.layer.cornerRadius = 8
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.gray.cgColor
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        }
    }
    
    // MARK: - Actions
    
    /// Handles user's answer selection.
    @IBAction func userAnswerButton(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text ?? ""
        
        // Check if user's answer is correct
        let rightAnswer = assessmentQuiz.checkAnswer(userAnswer: userAnswer)
        
        // Loop through answer buttons to update UI
        for button in answerButtons {
            // Highlight correct answer with a green background and add a checkmark symbol
            if button.titleLabel?.text == assessmentQuiz.sampleQuestions[assessmentQuiz.numberQuestion].options[assessmentQuiz.sampleQuestions[assessmentQuiz.numberQuestion].correctOptionIndex] {
                button.backgroundColor = .systemGreen
                button.setImage(UIImage(systemName: "checkmark"), for: .normal)
                button.tintColor = .white
            }
            
            // Handle user's selected answer
            if button == sender {
                button.isUserInteractionEnabled = false
                
                // Update UI based on user's correctness
                if rightAnswer {
                    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                    button.backgroundColor = .systemGreen
                    button.tintColor = .white
                    button.setImage(UIImage(systemName: "checkmark"), for: .normal)
                } else {
                    button.backgroundColor = .red
                    button.tintColor = .white
                    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                    // Provide haptic feedback for wrong answers
                    let generator = UIImpactFeedbackGenerator(style: .heavy)
                    generator.impactOccurred()
                }
            } else {
                button.isUserInteractionEnabled = false;
            }
        }
        
        // Display answerLabel and nextQuestion button
        answerLabel.isHidden = false
        nextQuestion.isHidden = false
    }
    
    /// Changes the question and resets UI elements.
    @objc func changeQuestion() {
        // Reset answer buttons appearance and enable interaction
        for button in answerButtons {
                button.backgroundColor = .white
                button.tintColor = .black
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                button.isUserInteractionEnabled = true
                button.setImage(UIImage(), for: .normal) // Remove checkmark symbol
            }
            
            // Update question and answer options
            let question = assessmentQuiz.numberQuestion
            let options = assessmentQuiz.sampleQuestions[question].options
            option1.setTitle("\(options[0])", for: .normal)
            option2.setTitle("\(options[1])", for: .normal)
            option3.setTitle("\(options[2])", for: .normal)
            option4.setTitle("\(options[3])", for: .normal)
            
            // Hide answerLabel and nextQuestion button
            answerLabel.isHidden = true
            nextQuestion.isHidden = true
            
            // Update questionText, questionNumber, imageQuestion, and progressBar
            questionText.text = "Q\(assessmentQuiz.numberQuestion+1). \(assessmentQuiz.getTextQuestion())"
            questionText.textColor = .black
            questionNumber.text = "Question \(assessmentQuiz.numberQuestion+1) of \(assessmentQuiz.sampleQuestions.count)"
            imageQuestion.image = assessmentQuiz.getImage()
            progressBar.progress = assessmentQuiz.getProgress()
        
        answerLabel.text = assessmentQuiz.getNote()
    }
    
    /// Moves to the next question or displays final score if the quiz is completed.
    @IBAction func moveToNextQuestion(_ sender: UIButton) {
        // Check if there are more questions or if the quiz is completed
        if assessmentQuiz.nextQuestion() {
            // If completed, show final score and prompt for restart
            let alert = UIAlertController(title: "Score: \(assessmentQuiz.score)", message: "Do you want to try again?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default){
                _ in
                // Reset quiz score and change question
                self.assessmentQuiz.score = 0
                Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.changeQuestion), userInfo: nil, repeats: false)
            }
            let noAction = UIAlertAction(title: "No", style: .cancel) { _ in
                // Dismiss quiz view controller if not restarting
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
