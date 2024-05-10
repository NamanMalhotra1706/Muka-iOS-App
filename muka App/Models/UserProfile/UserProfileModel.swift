import Foundation
import UIKit

// Structure to represent completion data for a course by a user
struct CourseCompletionByUser {
    let courseId: Int               // Unique identifier for the course
    let courseName: String          // Name of the course
    var badgesEarned: UserBadges   // Badges earned by the user for the course
    var medalsEarned: UserMedals   // Medals earned by the user for the course
}

enum TypeOfLevel {
    case LevelA
    case LevelB
    case LevelC
}

// Structure to represent user profile
struct UserProfile {
    var userId: Int                     // Unique identifier for the user
    var userAvatar: UIImage             // Image representing the user
    var userName: String                // Name of the user
    var userEmail: String               // Email of the user
    var completedCourses: [CourseCompletionByUser]   // Array of courses completed by the user
    var challengesCompleted: [Challenge]            // Array of challenges completed by the user
    var currentCourse: CurrentCourseEnrolled        // Information about the course currently enrolled by the user
    var currentEnrolledLesson : TypeOfLevel
}

// Structure to represent Current Enrolled Lesson

// Structure to represent the current course enrolled by the user
struct CurrentCourseEnrolled {
    var title: String           // Title of the current course
    var totalVideos: Int        // Total number of videos in the current course
    var userCompletedVideos: Int    // Number of videos completed by the user in the current course
    var isAssessmentTaken: Bool     // Indicates if the assessment for the course is taken by the user
}

// Structure to represent user medals
struct UserMedals {
    let imageName: UIImage     // Image representing the medal
    let title: String          // Title of the medal
}

// Structure to represent user badges
struct UserBadges {
    let imageName: UIImage     // Image representing the badge
    let title: String          // Title of the badge
}

// Class representing a User
class User {
    
    var sampleUsers: [UserProfile] = []   // Array to store sample user profiles
    
    // Initialize sample user data
    init() {
        // Sample user data initialization
        
        // Append sample user profiles to the array
        
        sampleUsers.append(UserProfile(userId: 1, userAvatar: UIImage(named: "Bitmogi")! ,userName: "Naman Malhotra", userEmail: "naman0913.be21@chitkara.edu.in",
                                       completedCourses: [
                                        CourseCompletionByUser(courseId: 1, courseName: "Intro to ISL", badgesEarned:UserBadges(imageName:UIImage(named: "silverCompletionBadge")!, title: "Silver Badge"),
                                                               medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal")),
                                        
                                        CourseCompletionByUser(courseId: 2, courseName: "Basic Signs", badgesEarned:UserBadges(imageName:UIImage(named: "bronzeCompletionBadge")!, title: "Bronze Badge"),
                                                               medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal")),
                                        
                                        CourseCompletionByUser(courseId: 3, courseName: "Basic Signs", badgesEarned:UserBadges(imageName:UIImage(named: "bronzeCompletionBadge")!, title: "Bronze Badge"),
                                                               medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal"))
                                       ],
                                       challengesCompleted:[levelAChallenge.basicChallenges[0], levelBChallenge.intermediateChallenges[3],
                                                            levelCChallenge.advancedChallenges[2]],
                                       
                                       currentCourse: CurrentCourseEnrolled(title: "\(coursesData.sampleCourses[4].courseName)", totalVideos:coursesData.sampleCourses[4].lessons.count , userCompletedVideos: 0, isAssessmentTaken: false),
                                       
                                       currentEnrolledLesson: .LevelA
                                      ))
        
        sampleUsers.append(UserProfile(userId: 2, userAvatar: UIImage(named: "Bitmogi")! ,userName: "Mansvi Grover", userEmail: "mansvi0859.be21@chitkara.edu.in",
                                       completedCourses: [
                                        CourseCompletionByUser(courseId: 1, courseName: "Intro to ISL", badgesEarned:UserBadges(imageName:UIImage(named: "silverCompletionBadge")!, title: "Silver Badge"),
                                                               medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal")),
                                        
                                        CourseCompletionByUser(courseId: 2, courseName: "Basic Signs", badgesEarned:UserBadges(imageName:UIImage(named: "bronzeCompletionBadge")!, title: "Bronze Badge"),
                                                               medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal")),
                                        
                                        CourseCompletionByUser(courseId: 3, courseName: "Basic Signs", badgesEarned:UserBadges(imageName:UIImage(named: "bronzeCompletionBadge")!, title: "Bronze Badge"),
                                                               medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal"))
                                       ],
                                       
                                       challengesCompleted:[levelAChallenge.basicChallenges[4], levelBChallenge.intermediateChallenges[1],
                                                            levelCChallenge.advancedChallenges[3]],
                                       
                                       currentCourse: CurrentCourseEnrolled(title: "\(coursesData.sampleCourses[2].courseName)", totalVideos:coursesData.sampleCourses[2].lessons.count , userCompletedVideos: 0, isAssessmentTaken: true),
                                       
                                       currentEnrolledLesson: .LevelB
                                      ))
    }
    
    func updateUser(userId: Int, newUserName: String, newUserEmail: String) {
        
        print("Updating in progress...")
        if let index = sampleUsers.firstIndex(where: { $0.userId == userId }) {
            sampleUsers[index].userName = newUserName
            sampleUsers[index].userEmail = newUserEmail
        } else {
            print("User not found for ID:", userId)
        }
    }
    
    func getUserInfo(userID: Int) -> UserProfile? {
        return sampleUsers.first { $0.userId == userID }
    }
    
    // Function to get completed courses by user ID
    func getCompletedCourses(userID: Int) -> [CourseCompletionByUser]? {
        return sampleUsers.first { $0.userId == userID }?.completedCourses
    }
    
    // Function to get completed courses by User
    func getTotalCompletedCourses(userID: Int) -> Int {
        if let user = sampleUsers.first(where: { $0.userId == userID }) {
            return user.completedCourses.count
        }
        return 0
    }
    
    // Function to get badges earned for a specific course by user ID
    func getBadgeEarnedByUserInCourse(userID: Int, courseId: Int) -> UserBadges? {
        if let user = sampleUsers.first(where: { $0.userId == userID }) {
            if let course = user.completedCourses.first(where: { $0.courseId == courseId }) {
                return course.badgesEarned
            }
        }
        return nil
    }
    
    func updateUserInfo(userID: Int, newUserName: String, newUserEmail: String) {
        if let userIndex = sampleUsers.firstIndex(where: { $0.userId == userID }) {
            sampleUsers[userIndex].userName = newUserName
            sampleUsers[userIndex].userEmail = newUserEmail
        } else {
            print("User not found with ID:", userID)
        }
    }
    
    func getChallengesCompletedByUser(userID: Int) -> [Challenge]? {
        if let user = sampleUsers.first(where: { $0.userId == userID }) {
            var allChallengesCompleted: [Challenge] = []
            
            for challenge in user.challengesCompleted {
                allChallengesCompleted.append(challenge)
            }
            
            return allChallengesCompleted
        }
        return nil
    }
    
    func updateUserCompletedVideos(for userID: Int, courseID: Int, numberOfVideosCompleted: Int) {
        if let userIndex = sampleUsers.firstIndex(where: { $0.userId == userID }) {
            // Get the current course enrollment
            var currentCourse = sampleUsers[userIndex].currentCourse
            
            // Update the number of completed videos
            currentCourse.userCompletedVideos += numberOfVideosCompleted
            
            // Replace the updated current course enrollment
            sampleUsers[userIndex].currentCourse = currentCourse
            
            //            print(currentCourse.userCompletedVideos)
        } else {
            print("User not found with ID:", userID)
        }
    }
    
    func getUserCompletion(for userId: Int, courseID: Int) -> Int {
        if let userIndex = sampleUsers.firstIndex(where: { $0.userId == userId }) {
            let currentCourse = self.sampleUsers[userIndex].currentCourse
            return currentCourse.userCompletedVideos
        } else { return -1 }
    }
    
    func getLoggedInUser()->Int{
        return 1
    }
    
    
}

class LessonManager {
    static var clickedLessonTitles: Set<String> = Set()
}



let user = User()

