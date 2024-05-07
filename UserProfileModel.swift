import Foundation
import UIKit

struct CourseCompeletionByUser {
    let courseId: Int
    let courseName: String
    var badgesEarned : UserBadges
//    var medalsEarned : [UserBadges]
}

struct UserProfile{
    var userId:Int
    var userAvatar: UIImage
    var userName: String
    var userEmail : String
    var completedCourses:[CourseCompeletionByUser]
}

//struct UserMedals {
//    let imageName: String
//    let title: String
//}

struct UserBadges {
    let imageName: UIImage
    let title: String
}


class User {
    
    var sampleUsers : [UserProfile] = []
    
    init(){
        
        sampleUsers.append(UserProfile(userId: 1, userAvatar: UIImage(named: "Bitmogi")! ,userName: "Naman Malhotra", userEmail: "naman0913.be21@chitkara.edu.in",
                                       completedCourses: [
                                            CourseCompeletionByUser(courseId: 1, courseName: "Intro to ISL", badgesEarned:UserBadges(imageName:UIImage(named: "silverCompletionBadge")!, title: "Silver Badge")),
                                            CourseCompeletionByUser(courseId: 2, courseName: "Basic Signs", badgesEarned:UserBadges(imageName:UIImage(named: "bronzeCompletionBadge")!, title: "Bronze Badge"))
                                       ]))
        
        sampleUsers.append(UserProfile(userId: 2, userAvatar: UIImage(named: "Bitmogi")! ,userName: "Mansvi Grover", userEmail: "mansvi0859.be21@chitkara.edu.in",
                                       completedCourses: [
                                            CourseCompeletionByUser(courseId: 1, courseName: "Intro to ISL", badgesEarned:UserBadges(imageName:UIImage(named: "silverCompletionBadge")!, title: "Silver Badge")),
                                            CourseCompeletionByUser(courseId: 2, courseName: "Basic Signs", badgesEarned:UserBadges(imageName:UIImage(named: "bronzeCompletionBadge")!, title: "Bronze Badge"))
                                       ]))
    }
    
    
    func getUserInfo(userID: Int) -> UserProfile? {
            return sampleUsers.first { $0.userId == userID }
        }

    // Function to get completed courses by user ID
    func getCompletedCourses(userID: Int) -> [CourseCompeletionByUser]? {
            return sampleUsers.first { $0.userId == userID }?.completedCourses
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
    }





