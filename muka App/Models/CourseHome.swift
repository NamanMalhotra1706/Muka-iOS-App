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
    let totalVideos : Int
    let status: Status
    let image: UIImage
    let hasDisclouserIndicator : Bool
    let lessons  : [CoursesLesson]
    
}

// Define a class to represent the data model
class CourseDataModel {
    
    var sampleCourses: [CourseHome] = []
    
    init() {
        sampleCourses.append(CourseHome(courseId: 1, courseName: "Introduction to ISL", courseIcon: "commonCourseIcon", totalVideos: 10 , status: .completed , image: UIImage(named: "Basic-IntroToISL")! ,hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Basic ISL Alphabet", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Greetings and Farewells",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Numbers and Counting",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Common Signs for Everyday Objects",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Introduction to ISL Grammar",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 2, courseName: "Family and Relationships", courseIcon: "intermediate_sign_language_icon",totalVideos:10 , status: .takeAssessment, image: UIImage(named: "Basic-Family")!, hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Family Members and Relatives", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Describing Relationships",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Family Activities and Traditions",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Expressing Emotions and Feelings",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Conflict Resolution in Relationships",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 3, courseName: "Colors and Shapes", courseIcon: "advanced_sign_language_icon",totalVideos: 10 , status: .inProgress, image: UIImage(named: "Basic-Color&Shape")!, hasDisclouserIndicator: true,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Primary Colors in ISL", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Shapes and Geometric Figures",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Describing Objects by Color and Shape",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Patterns and Designs",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Art and Creativity in ISL",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 4, courseName: "Daily Activities", courseIcon: "sign_language_certification_icon",totalVideos: 10 , status:.locked,image: UIImage(named: "Basic-DailyActivities")!, hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Morning Routine", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Evening Routine",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: " Household Chores",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Personal Hygiene",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Leisure Activities",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 5, courseName: "Food and Drinks", courseIcon: "sign_language_basics_icon",totalVideos: 10 , status:.locked,image: UIImage(named: "Basic-IntroToISL")!,hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Common Food Items", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Cooking Methods",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Dining Etiquette",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: " Ordering Food",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Favorite Recipes",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 6, courseName: "Time and Calendar", courseIcon: "expressive_sign_language_icon",totalVideos: 10 , status:.locked,image: UIImage(named: "Basic-Time")!,hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Days of the Week", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Months of the Year",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Seasons",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Telling Time",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Calendar Events",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 7, courseName: "Clothing and Accessories", courseIcon: "sign_language_grammar_icon",totalVideos: 5 , status:.locked,image: UIImage(named: "Basic-IntroToISL")!,hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Types of Clothing", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Fashion Trends",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Accessories",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Dressing for Occasions",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Shopping for Clothes",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 8, courseName: "Health and Wellness", courseIcon: "asl_icon",totalVideos: 10 , status:.locked,image: UIImage(named: "Basic-IntroToISL")!,hasDisclouserIndicator: false,lessons:
                                            [CoursesLesson(lessonId: 1, lessonTitle: "Body Parts and Health", lessonDuration: 5),
                                             CoursesLesson(lessonId: 2, lessonTitle: "Healthy Lifestyle",lessonDuration: 4),
                                             CoursesLesson(lessonId: 3, lessonTitle: "Exercise and Fitness",lessonDuration: 4),
                                             CoursesLesson(lessonId: 4, lessonTitle: "Mental Health Awareness",lessonDuration: 4),
                                             CoursesLesson(lessonId: 5, lessonTitle: "Healthcare Services",lessonDuration: 4),
                                            ]))
        
        sampleCourses.append(CourseHome(courseId: 9, courseName: "Transportation and Travel", courseIcon: "bsl_icon",totalVideos: 10 , status:.locked,image: UIImage(named: "Basic-Travel&Transport")!,hasDisclouserIndicator: false,lessons:
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
    
    
    }

