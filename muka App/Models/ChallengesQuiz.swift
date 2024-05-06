import Foundation
import UIKit

struct challengesQuestion {
    let questionId: String
    let questionText: String
    let imageURL: URL?
}

struct challengeQuiz{
    let sampleQuestionsChallanges: [challengesQuestion] = [
        challengesQuestion(questionId: "1", questionText: "How to sign 'M' in sign language?", imageURL: nil),
        challengesQuestion(questionId: "2", questionText: "Please demonstrate the sign for 'thank you'.", imageURL: nil),
        challengesQuestion(questionId: "3", questionText: "What is the sign for 'yes' in Indian sign language?", imageURL: nil),
        challengesQuestion(questionId: "4", questionText: "Show the sign for 'help'.", imageURL: nil),
        challengesQuestion(questionId: "5", questionText: "How do you sign 'sorry' in Indian sign language?", imageURL: nil)
        
        ]
        
        var questionNumber = 0
        var challengesScore = 0
    
        
    mutating func checkAnswer() -> Bool {
        
        return false
    }
    
    
    func getScore()->Int{
        return challengesScore
    }
    
    func getTextQuestion()->String{
        return sampleQuestionsChallanges[questionNumber].questionText
    }
    
    func getProgress()->Float{
        let progress = Float(questionNumber+1)/Float(sampleQuestionsChallanges.count)
        return progress
    }
    
    
    mutating func nextQuestion()->Bool{
        if questionNumber+1 <  sampleQuestionsChallanges.count{
            questionNumber+=1
            return false
        }
        else{
            questionNumber = 0
            return true
        }
    }
    
        
    
}

