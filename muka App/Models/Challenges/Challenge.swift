import UIKit

// Structure representing a challenge
struct Challenge {
    let title: String           // Title of the challenge
    let description: String     // Description of the challenge
    let difficulty: String      // Difficulty level of the challenge
    var progress: Int           // Progress or marks obtained by the user
    let totalMarks: Int         // Total marks possible for the challenge
    let scoredMarks: Int        // Marks scored by the user
    let rewards: String         // Rewards associated with completing the challenge
    let image: UIImage?         // Image representing the challenge
}

// Structure containing Level A challenges
struct LevelAChallenges {
    let basicChallenges: [Challenge] = [
        Challenge(title: "Basic ISL Alphabet Quiz",
                  description: "Test your knowledge of the basic ISL alphabet letters.",
                  difficulty: "Easy",
                  progress: 0,
                  totalMarks: 10,
                  scoredMarks: 8,
                  rewards: "Earn a 'Letter Learner' badge upon completing the quiz with a high score.",
                  image: UIImage(named: "Quiz_Alphabet")!),
        
        
        Challenge(title: "Greetings and Farewells Test",
                  description: "Practice common greetings and farewells in ISL.",
                  difficulty: "Medium",
                  progress: 0,
                  totalMarks: 20,
                  scoredMarks: 18,
                  rewards: "Unlock the 'Social Connector' badge for demonstrating proficiency in greetings.",
                  image: UIImage(named: "Quiz_Greeting")!),
        
        Challenge(title: "Numbers and Counting Challenge",
                  description: "Master numbers and counting in ISL.",
                  difficulty: "Medium",
                  progress: 0,
                  totalMarks: 15,
                  scoredMarks: 10,
                  rewards: "Achieve the 'Math Whiz' badge by correctly answering all counting questions.",
                  image: UIImage(named: "Quiz_Numbers")!),
        
        Challenge(title: "Common Signs for Everyday Objects Quiz",
                  description: "Identify ISL signs for everyday objects.",
                  difficulty: "Easy to Medium",
                  progress: 0,
                  totalMarks: 10,
                  scoredMarks: 10,
                  rewards: "Earn the 'Object Identifier' badge for correctly identifying a set of common signs.",
                  image: UIImage(named: "Quiz_CommonObject")!),
        
        Challenge(title: "Introduction to ISL Grammar Test",
                  description: "Test your understanding of basic ISL grammar rules.",
                  difficulty: "Medium to Hard",
                  progress: 0,
                  totalMarks: 30,
                  scoredMarks: 26,
                  rewards: "Obtain the 'Grammar Guru' badge by achieving a high score on the grammar test.",
                  image: UIImage(named: "Quiz_Grammar")!)
    ]
}

// Intatiate levalAChallenegs
var levelAChallenge = LevelAChallenges()


// Structure containing Level B challenges
struct LevelBChallenges {
    let intermediateChallenges: [Challenge] = [
        Challenge(title: "Family Members and Relationships Test",
                  description: "Assess your knowledge of ISL signs for family members and relationships.",
                  difficulty: "Easy",
                  progress: 0,
                  totalMarks: 20,
                  scoredMarks: 18,
                  rewards: "Family Expert",
                  image: UIImage(named: "Quiz_Family")!),
        
        Challenge(title: "Describing Relationships Challenge",
                  description: "Practice describing various types of relationships in ISL.",
                  difficulty: "Medium",
                  progress: 0,
                  totalMarks: 10,
                  scoredMarks: 9,
                  rewards: "Relationship Master",
                  image: UIImage(named: "Quiz_Describerelations")!),
        
        Challenge(title: "Family Activities and Traditions Quiz",
                  description: "Test your knowledge of ISL signs related to family activities and traditions.",
                  difficulty: "Medium",
                  progress: 0,
                  totalMarks: 10,
                  scoredMarks: 9,
                  rewards: "Family Traditions",
                  image: UIImage(named: "Quiz_FamilyTradition")!),
        
        Challenge(title: "Expressing Emotions and Feelings Test",
                  description: "Assess your ability to express emotions and feelings using ISL.",
                  difficulty: "Medium",
                  progress: 0,
                  totalMarks: 25,
                  scoredMarks: 24,
                  rewards: "Emotion Explorer",
                  image: UIImage(named: "Quiz_Emotions")!),
        
        Challenge(title: "Conflict Resolution in Relationships Challenge",
                  description: "Practice ISL signs and phrases for resolving conflicts in relationships.",
                  difficulty: "Hard",
                  progress: 0,
                  totalMarks: 30,
                  scoredMarks: 28,
                  rewards: "Conflict Resolver",
                  image: UIImage(named: "Quiz_Conflict")!)
    ]
}

// Intatiate levalBChallenegs
var levelBChallenge = LevelBChallenges()


// Structure containing Level C challenges

struct LevelCChallenges {
    let advancedChallenges: [Challenge] = [
        Challenge(title: "Primary Colors in ISL Quiz",
                  description: "Test your knowledge of primary colors in ISL.",
                  difficulty: "Medium",
                  progress: 0,
                  totalMarks: 30,
                  scoredMarks: 26,
                  rewards: "Unlock the 'Color Connoisseur' badge for correctly identifying primary colors.",
                  image: UIImage(named: "Quiz_Colors")!),
        
        Challenge(title: "Shapes and Geometric Figures Test",
                  description: "Assess your understanding of ISL signs for shapes and geometric figures.",
                  difficulty: "Medium to Hard",
                  progress: 0,
                  totalMarks: 20,
                  scoredMarks: 20,
                  rewards: "Obtain the 'Shape Specialist' badge by correctly identifying various shapes.",
                  image: UIImage(named: "Quiz_Shapes")!),
        
        Challenge(title: "Describing Objects by Color and Shape Challenge",
                  description: "Practice describing objects using ISL signs for color and shape.",
                  difficulty: "Hard",
                  progress: 0,
                  totalMarks: 30,
                  scoredMarks: 26,
                  rewards: "Earn the 'Visual Descriptor' badge by accurately describing objects based on color and shape.",
                  image: UIImage(named: "Quiz_Objects")!),
        
        Challenge(title: "Patterns and Designs Quiz",
                  description: "Test your knowledge of ISL signs for patterns and designs.",
                  difficulty: "Medium",
                  progress: 0,
                  totalMarks: 20,
                  scoredMarks: 19,
                  rewards: "Unlock the 'Pattern Pro' badge for correctly identifying patterns and designs.",
                  image: UIImage(named: "Quiz_Patterns")!),
        
        Challenge(title: "Art and Creativity in ISL Test",
                  description: "Assess your understanding of ISL signs related to art and creativity.",
                  difficulty: "Hard",
                  progress: 0,
                  totalMarks: 25,
                  scoredMarks: 20,
                  rewards: "Obtain the 'Creative Genius' badge by demonstrating proficiency in art-related signs.",
                  image: UIImage(named: "Quiz_Art&Creativity")!)
    ]
}

// Intatiate levalCChallenegs
var levelCChallenge = LevelCChallenges()
