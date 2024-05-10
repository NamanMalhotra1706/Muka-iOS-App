//
//  CourseHome.swift
//  muka App
//
//  Created by student on 01/05/24.
//

import Foundation
import UIKit
// Define the Status enum to represent different statuses
enum Status {
    case completed
    case takeAssessment
    case inProgress
    case locked
}

struct CoursesLesson {
    let lessonId: Int
    let lessonTitle: String
    let lessonDuration: Int // Duration of the lesson in minutes
}

struct CourseHome {
    let courseId: Int
    let courseName: String
    let courseIcon: String
    let status: Status
    let image: UIImage
    let hasDisclouserIndicator : Bool
    let lessons  : [CoursesLesson]
    
    var totalDuration: Int {
        return lessons.reduce(0) { $0 + $1.lessonDuration }
    }
    
}

// Define a class to represent the data model
class CourseDataModel {
    
    var sampleCourses: [CourseHome] = []
    
    
    init() {
        sampleCourses.append(CourseHome(courseId: 1, courseName: "Daily User Words - I", courseIcon: "commonCourseIcon", status: .completed , image: UIImage(named: "Basic-IntroToISL")! ,hasDisclouserIndicator: true,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Accessibility", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "All the best",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Amazing",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Busy",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Communicate",lessonDuration: 4),
                                             CoursesLesson(lessonId: 6, lessonTitle: "Accessibility", lessonDuration: 5),
                                             CoursesLesson(lessonId: 7, lessonTitle: "All the best",lessonDuration: 4),
                                             CoursesLesson(lessonId: 8, lessonTitle: "Amazing",lessonDuration: 4),
                                             CoursesLesson(lessonId: 9, lessonTitle: "Busy",lessonDuration: 4),
                                             CoursesLesson(lessonId: 10, lessonTitle: "Communicate",lessonDuration: 4),
                                             CoursesLesson(lessonId: 11, lessonTitle: "Cool",lessonDuration: 4),
                                             CoursesLesson(lessonId: 12, lessonTitle: "Deaf",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 2, courseName: "Daily User Words - II", courseIcon: "intermediate_sign_language_icon", status: .takeAssessment, image: UIImage(named: "Basic-Family")!, hasDisclouserIndicator: true,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Pen", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Please",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Sad",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "See you Tommorow",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Sorry",lessonDuration: 4),
                                             CoursesLesson(lessonId: 6, lessonTitle: "Start", lessonDuration: 5),
                                             CoursesLesson(lessonId: 7, lessonTitle: "Tea",lessonDuration: 4),
                                             CoursesLesson(lessonId: 8, lessonTitle: "Thank You",lessonDuration: 4),
                                             CoursesLesson(lessonId: 9, lessonTitle: "Time",lessonDuration: 4),
                                             CoursesLesson(lessonId: 10, lessonTitle: "Win",lessonDuration: 4),
                                             CoursesLesson(lessonId: 11, lessonTitle: "Work",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 3, courseName: "Daily User Words - III", courseIcon: "advanced_sign_language_icon", status: .inProgress, image: UIImage(named: "Basic-Color&Shape")!, hasDisclouserIndicator: true,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Enjoy", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Finish",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Good Afternoon",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Good Morning",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Good Night",lessonDuration: 4),
                                             CoursesLesson(lessonId: 6, lessonTitle: "Good", lessonDuration: 5),
                                             CoursesLesson(lessonId: 7, lessonTitle: "Happy",lessonDuration: 4),
                                             CoursesLesson(lessonId: 8, lessonTitle: "Hearing",lessonDuration: 4),
                                             CoursesLesson(lessonId: 9, lessonTitle: "Home",lessonDuration: 4),
                                             CoursesLesson(lessonId: 10, lessonTitle: "I, Me",lessonDuration: 4),
                                             CoursesLesson(lessonId: 11, lessonTitle: "Important",lessonDuration: 4),
                                             CoursesLesson(lessonId: 12, lessonTitle: "Office",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 4, courseName: "Daily Activities", courseIcon: "sign_language_certification_icon", status:.locked,image: UIImage(named: "Basic-DailyActivities")!, hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Morning Routine", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Evening Routine",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: " Household Chores",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Personal Hygiene",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Leisure Activities",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 5, courseName: "Food and Drinks", courseIcon: "sign_language_basics_icon", status:.locked,image: UIImage(named: "Basic-IntroToISL")!,hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Common Food Items", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Cooking Methods",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Dining Etiquette",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: " Ordering Food",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Favorite Recipes",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 6, courseName: "Time and Calendar", courseIcon: "expressive_sign_language_icon", status:.locked,image: UIImage(named: "Basic-Time")!,hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Days of the Week", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Months of the Year",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Seasons",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Telling Time",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Calendar Events",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 7, courseName: "Clothing and Accessories", courseIcon: "sign_language_grammar_icon", status:.locked,image: UIImage(named: "Basic-IntroToISL")!,hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Types of Clothing", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Fashion Trends",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Accessories",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Dressing for Occasions",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Shopping for Clothes",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 8, courseName: "Health and Wellness", courseIcon: "asl_icon", status:.locked,image: UIImage(named: "Basic-IntroToISL")!,hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Body Parts and Health", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Healthy Lifestyle",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Exercise and Fitness",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Mental Health Awareness",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Healthcare Services",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 9, courseName: "Transportation and Travel", courseIcon: "bsl_icon", status:.locked,image: UIImage(named: "Basic-Travel&Transport")!,hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Modes of Transportation", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Planning a Trip",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Booking Tickets",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Travel Vocabulary",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Traveling Etiquette",lessonDuration: 4),
                                            ]))
    }
    
    func getAllCourses() -> [CourseHome] { return self.sampleCourses }
    
    func getLessonsInCourses(IndexPath idx: Int) -> [CoursesLesson] {
        return sampleCourses[idx].lessons
    }
    
    func getTotalNumberOfCourses() -> Int {
        return sampleCourses.count
    }
    
    func getTotalNumberOfLessons() -> Int {
        var totalLessons = 0
        for course in sampleCourses {
            totalLessons += course.lessons.count
        }
        return totalLessons
    }
    
    
}

var coursesData = CourseDataModel()

