import Foundation
import UIKit



struct CourseCompeletionByUser {
    let courseId: Int
    let courseName: String
    var badgesEarned : UserBadges
    var medalsEarned : UserMedals
}

struct UserProfile{
    var userId:Int
    var userAvatar: UIImage
    var userName: String
    var userEmail : String
    var completedCourses:[CourseCompeletionByUser]
    var challengesCompleted:[Challenge]
    var currentCourse : CurrentCourseEnrolled
    
}

struct CurrentCourseEnrolled{
    var title: String
    var totalVideos: Int
    var userCompletedVideos: Int
    var isAssessmnetTaken: Bool
}

struct UserMedals {
    let imageName: UIImage
    let title: String
}

struct UserBadges {
    let imageName: UIImage
    let title: String
}


class User {
    
    var sampleUsers : [UserProfile] = []
    
    
    init(){
        
        sampleUsers.append(UserProfile(userId: 1, userAvatar: UIImage(named: "Bitmogi")! ,userName: "Naman Malhotra", userEmail: "naman0913.be21@chitkara.edu.in",
                                       completedCourses: [
                                        CourseCompeletionByUser(courseId: 1, courseName: "Intro to ISL", badgesEarned:UserBadges(imageName:UIImage(named: "silverCompletionBadge")!, title: "Silver Badge"),
                                                                medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal")),
                                        
                                        CourseCompeletionByUser(courseId: 2, courseName: "Basic Signs", badgesEarned:UserBadges(imageName:UIImage(named: "bronzeCompletionBadge")!, title: "Bronze Badge"),
                                                                medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal")),
                                        
                                        CourseCompeletionByUser(courseId: 3, courseName: "Basic Signs", badgesEarned:UserBadges(imageName:UIImage(named: "bronzeCompletionBadge")!, title: "Bronze Badge"),
                                                                medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal"))
                                       ],
                                       challengesCompleted:[levelAChallenge.basicChallenges[0], levelBChallenge.intermediateChallenges[3],
                                                            levelCChallenge.advancedChallenges[2]],
                                       
                                       currentCourse: CurrentCourseEnrolled(title: "\(coursesData.sampleCourses[4].courseName)", totalVideos:coursesData.sampleCourses[4].lessons.count , userCompletedVideos: 0, isAssessmnetTaken: false)))
        
        sampleUsers.append(UserProfile(userId: 2, userAvatar: UIImage(named: "Bitmogi")! ,userName: "Mansvi Grover", userEmail: "mansvi0859.be21@chitkara.edu.in",
                                       completedCourses: [
                                        CourseCompeletionByUser(courseId: 1, courseName: "Intro to ISL", badgesEarned:UserBadges(imageName:UIImage(named: "silverCompletionBadge")!, title: "Silver Badge"),
                                                                medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal")),
                                        
                                        CourseCompeletionByUser(courseId: 2, courseName: "Basic Signs", badgesEarned:UserBadges(imageName:UIImage(named: "bronzeCompletionBadge")!, title: "Bronze Badge"),
                                                                medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal")),
                                        
                                        CourseCompeletionByUser(courseId: 3, courseName: "Basic Signs", badgesEarned:UserBadges(imageName:UIImage(named: "bronzeCompletionBadge")!, title: "Bronze Badge"),
                                                                medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal"))
                                       ],
                                       
                                       challengesCompleted:[levelAChallenge.basicChallenges[4], levelBChallenge.intermediateChallenges[1],
                                                            levelCChallenge.advancedChallenges[3]],
                                       
                                       currentCourse: CurrentCourseEnrolled(title: "\(coursesData.sampleCourses[2].courseName)", totalVideos:coursesData.sampleCourses[2].lessons.count , userCompletedVideos: 0, isAssessmnetTaken: true)))
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
    func getCompletedCourses(userID: Int) -> [CourseCompeletionByUser]? {
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
            var currentCourse = self.sampleUsers[userIndex].currentCourse
            return currentCourse.userCompletedVideos
        } else { return -1 }
    }
    

}

class LessonManager {
    static var clickedLessonTitles: Set<String> = Set()
}


let user = User()

