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
    
    static var archiveUrl :  URL {
        let document = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = document.appendingPathComponent("UserInformation").appendingPathExtension("plist")
        
        return archiveURL
    }
    
    
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
                                            medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal"))
                                       ]))
        
        sampleUsers.append(UserProfile(userId: 2, userAvatar: UIImage(named: "Bitmogi")! ,userName: "Mansvi Grover", userEmail: "mansvi0859.be21@chitkara.edu.in",
                                       completedCourses: [
                                        CourseCompeletionByUser(courseId: 1, courseName: "Intro to ISL", badgesEarned:UserBadges(imageName:UIImage(named: "silverCompletionBadge")!, title: "Silver Badge"),
                                            medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal")),
                                        
                                        CourseCompeletionByUser(courseId: 2, courseName: "Basic Signs", badgesEarned:UserBadges(imageName:UIImage(named: "bronzeCompletionBadge")!, title: "Bronze Badge"),
                                            medalsEarned: UserMedals(imageName: UIImage(named:"goldMedal")!, title: "Gold Medal"))
                                       ]))
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
    
}


let user = User()

