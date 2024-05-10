import Foundation
import UIKit

// Structure representing a challenge question
struct ChallengesQuestion {
    let questionId: String      // Unique identifier for the question
    let questionText: String    // Text of the question
    let imageURL: URL?          // Optional URL for an image related to the question
}

// Class representing a challenge quiz
class ChallengeQuiz {
    let sampleQuestionsChallenges: [ChallengesQuestion] = [
        // Sample challenge questions initialization
        ChallengesQuestion(questionId: "1", questionText: "How to sign 'M' in sign language?", imageURL: nil),
        ChallengesQuestion(questionId: "2", questionText: "Please demonstrate the sign for 'thank you'.", imageURL: nil),
        ChallengesQuestion(questionId: "3", questionText: "What is the sign for 'yes' in Indian sign language?", imageURL: nil),
        ChallengesQuestion(questionId: "4", questionText: "Show the sign for 'help'.", imageURL: nil),
        ChallengesQuestion(questionId: "5", questionText: "How do you sign 'sorry' in Indian sign language?", imageURL: nil)
    ]
    
    var questionNumber = 0       // Current question number
    var challengesScore = 0      // Score obtained in the challenge
    
    // Method to check the answer (currently placeholder)
    func checkAnswer() -> Bool {
        return false
    }
    
    // Method to get the current score
    func getScore() -> Int {
        return challengesScore
    }
    
    // Method to get the text of the current question
    func getTextQuestion() -> String {
        return sampleQuestionsChallenges[questionNumber].questionText
    }
    
    // Method to get the progress of the quiz
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(sampleQuestionsChallenges.count)
        return progress
    }
    
    // Method to move to the next question
    func nextQuestion() -> Bool {
        if questionNumber + 1 < sampleQuestionsChallenges.count {
            questionNumber += 1
            return false
        } else {
            questionNumber = 0
            return true
        }
    }
}

// Create an instance of the challenge quiz
var challengesQuiz = ChallengeQuiz()
