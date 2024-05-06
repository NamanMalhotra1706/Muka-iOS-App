//
//  CourseHome.swift
//  muka App
//
//  Created by student on 01/05/24.
//

import Foundation
// Define the Status enum to represent different statuses
enum Status {
    case completed
    case takeAssessment
    case inProgress
    case locked
}


struct CourseHome {
    let courseId: Int
    let courseName: String
    let courseIcon: String
    let totalVideos : Int
    let status: Status
    let hasDisclouserIndicator : Bool
}



//let commonCourseIcon = "common_course_icon"

// Define a class to represent the data model
class CourseDataModel {
    
    let sampleCourses: [CourseHome] = [
            CourseHome(courseId: 1, courseName: "Beginner Sign Language", courseIcon: "commonCourseIcon", totalVideos: 5 , status: .completed , hasDisclouserIndicator: false),
            CourseHome(courseId: 2, courseName: "Intermediate Sign Language", courseIcon: "intermediate_sign_language_icon",totalVideos: 5 , status: .takeAssessment, hasDisclouserIndicator: false),
            CourseHome(courseId: 3, courseName: "Advanced Sign Language", courseIcon: "advanced_sign_language_icon",totalVideos: 5 , status: .inProgress, hasDisclouserIndicator: true),
            CourseHome(courseId: 4, courseName: "Sign Language Certification", courseIcon: "sign_language_certification_icon",totalVideos: 5 , status:.locked,hasDisclouserIndicator: false),
            CourseHome(courseId: 5, courseName: "Sign Language Basics", courseIcon: "sign_language_basics_icon",totalVideos: 5 , status:.locked,hasDisclouserIndicator: false),
            CourseHome(courseId: 6, courseName: "Expressive Sign Language", courseIcon: "expressive_sign_language_icon",totalVideos: 5 , status:.locked,hasDisclouserIndicator: false),
            CourseHome(courseId: 7, courseName: "Sign Language Grammar", courseIcon: "sign_language_grammar_icon",totalVideos: 5 , status:.locked,hasDisclouserIndicator: false),
            CourseHome(courseId: 8, courseName: "American Sign Language (ASL)", courseIcon: "asl_icon",totalVideos: 5 , status:.locked,hasDisclouserIndicator: false),
            CourseHome(courseId: 9, courseName: "British Sign Language (BSL)", courseIcon: "bsl_icon",totalVideos: 5 , status:.locked,hasDisclouserIndicator: false),
        ]
    }


func printSampleCourses() {
    
}

