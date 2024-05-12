
import Foundation
import UIKit

// Structure representing a quiz question
struct Question {
    var questionId: String        // Unique identifier for the question
    var questionText: String      // Text of the question
    var imageURL: UIImage         // Image associated with the question
    var options: [String]         // Array of options for the question
    var note: String              // Additional note or explanation for the question
    var correctOptionIndex: Int   // Index of the correct option in the options array
}

// Class representing a quiz
class Quiz {
    
    let sampleQuestions: [Question]    // Array to store sample quiz questions
    
    var numberQuestion = 0      // Variable to track the current question number
    var score = 0               // Variable to store the user's score
    
    // Initialize sample quiz questions
    init() {
        sampleQuestions = [
            // Sample quiz questions initialization
            Question(questionId: "1",
                     questionText: "What does the below Sign Indicates?",
                     imageURL: UIImage(named: "Thankyou sign")!,
                     options: ["Thankyou", "Hello", "GoodBye", "Please"],
                     note: "Note : Typically involves placing the palm of one hand on the chest and making a small circular motion. It's a gesture of gratitude.",
                     correctOptionIndex: 0),
            
            Question(questionId: "2",
                     questionText: "What does the below Sign Indicates?",
                     imageURL: UIImage(named: "Goodbye")!,
                     options: ["Hey", "Goodbye", "Welcome", "Request"],
                     note: "Note: Often involves waving one hand while smiling. It's a friendly gesture to bid farewell. ",
                     correctOptionIndex: 0),
            
            Question(questionId: "3",
                     questionText: "What does the below Sign Indicates?",
                     imageURL: UIImage(named: "HelloSign")!,
                     options: ["Bye", "Hello", "How", "Thankyou"],
                     note: "Note : Often similar to the English version, involving a wave or a nod of acknowledgment",
                     correctOptionIndex: 0),
            
            Question(questionId: "4",
                     questionText: "What does the below Sign Indicates?",
                     imageURL: UIImage(named: "No Sign")!,
                     options: ["Approval", "No", "Apology", "Request"],
                     note: "Note : Involves shaking the head from side to side or making a horizontal slashing motion with the hand",
                     correctOptionIndex: 0),
            
            Question(questionId: "5",
                     questionText: "What does the below Sign Indicates?",
                     imageURL: UIImage(named: "Please")!,
                     options: ["Yes", "Hello", "Welcome", "Please"],
                     note: "Note : Involve holding one hand palm-up and making a gentle circular motion with the other hand on top of it. It's a polite request gesture",
                     correctOptionIndex: 0),
            
            Question(questionId: "6",
                     questionText: "What does the below Sign Indicates?",
                     imageURL: UIImage(named: "YesSign")!,
                     options: ["Bye", "Yes", "Apology", "Request"],
                     note: "Note : Typically involves nodding the head or making an upward motion with the hand. It's an affirmative gesture.",
                     correctOptionIndex: 0),
        ]
    }
        // Function to check if the user's answer is correct
           func checkAnswer(userAnswer: String) -> Bool {
               let currentQuestion = sampleQuestions[numberQuestion]
               let correctOption = currentQuestion.options[currentQuestion.correctOptionIndex]
               let isCorrect = userAnswer == correctOption
               if isCorrect {
                   score += 1
               }
               return isCorrect
           }
           
           // Function to get the user's score
           func getScore() -> Int {
               return score
           }
           
           // Function to get the text of the current question
           func getTextQuestion() -> String {
               return sampleQuestions[numberQuestion].questionText
           }
           
           // Function to get the progress of the quiz (as a float value between 0 and 1)
           func getProgress() -> Float {
               let progress = Float(numberQuestion + 1) / Float(sampleQuestions.count)
               return progress
           }
           
           // Function to get the image associated with the current question
           func getImage() -> UIImage! {
               return sampleQuestions[numberQuestion].imageURL
           }
           
           // Function to get the additional note or explanation for the current question
           func getNote() -> String {
               return sampleQuestions[numberQuestion].note
           }
           
           // Function to move to the next question in the quiz
           // Returns true if all questions have been answered, false otherwise
           func nextQuestion() -> Bool {
               if numberQuestion + 1 < sampleQuestions.count {
                   numberQuestion += 1
                   return false
               } else {
                   numberQuestion = 0
                   return true
               }
           }
       }
