import Foundation
import UIKit

struct Question {
    var questionId: String
    var questionText: String
    var imageURL: UIImage
    var options: [String]
    var note : String
    var correctOptionIndex: Int
}

class Quiz {
    
    let sampleQuestions: [Question] = [
        Question(questionId: "1",
                 questionText: "What does the below Sign Indicates?",
                 imageURL: UIImage(named: "Thankyou sign")!,
                 options: ["Thankyou", "Hello", "GoodBye", "Please"],
                 note: "The first closed amnd two thumbs pointings upward sign indicates the 'Approval' towards something",
                 correctOptionIndex: 0),
        
        Question(questionId: "2",
                 questionText: "What does the below Sign Indicates?",
                 imageURL: UIImage(named: "Goodbye")!,
                 options: ["Hey", "Goodbye", "Welcome", "Request"],
                 note: "The first closed amnd two thumbs pointings upward sign indicates the 'Approval' towards something",
                 correctOptionIndex: 0),
        
        Question(questionId: "3",
                 questionText: "What does the below Sign Indicates?",
                 imageURL: UIImage(named: "HelloSign")!,
                 options: ["Bye", "Hello", "How", "Thankyou"],
                 note: "The first closed amnd two thumbs pointings upward sign indicates the 'Approval' towards something",
                 correctOptionIndex: 0),
        
        Question(questionId: "4",
                 questionText: "What does the below Sign Indicates?",
                 imageURL: UIImage(named: "No Sign")!,
                 options: ["Approval", "No", "Apology", "Request"],
                 note: "The first closed amnd two thumbs pointings upward sign indicates the 'Approval' towards something",
                 correctOptionIndex: 0),
        
        Question(questionId: "5",
                 questionText: "What does the below Sign Indicates?",
                 imageURL: UIImage(named: "Please")!,
                 options: ["Yes", "Hello", "Welcome", "Please"],
                 note: "The first closed amnd two thumbs pointings upward sign indicates the 'Approval' towards something",
                 correctOptionIndex: 0),
        
        Question(questionId: "6",
                 questionText: "What does the below Sign Indicates?",
                 imageURL: UIImage(named: "YesSign")!,
                 options: ["Bye", "Yes", "Apology", "Request"],
                 note: "The first closed amnd two thumbs pointings upward sign indicates the 'Approval' towards something",
                 correctOptionIndex: 0),
    ]
    
    var numberQuestion = 0
    var score = 0
    
    func checkAnswer(userAnswer: String) -> Bool {
        let currentQuestion = sampleQuestions[numberQuestion]
        let correctOption = currentQuestion.options[currentQuestion.correctOptionIndex]
        let isCorrect = userAnswer == correctOption
        if isCorrect {
            score += 1
        }
        return isCorrect
    }
    
    func getScore()->Int{
        return score
    }
    
    func getTextQuestion()->String{
        // print(sampleQuestions[numberQuestion].questionText)
        return sampleQuestions[numberQuestion].questionText
    }
    
    func getProgress()->Float{
        let progress = Float(numberQuestion+1)/Float(sampleQuestions.count)
        return progress
    }
    
    func getImage()-> UIImage!{
        return sampleQuestions[numberQuestion].imageURL
    }
    
    func getNote()->String{
        return sampleQuestions[numberQuestion].note
    }
    
     func nextQuestion()->Bool{
        if numberQuestion + 1 < sampleQuestions.count{
            numberQuestion+=1
            return false
        }
        else{
           numberQuestion=0
            return true
        }
    }
}

