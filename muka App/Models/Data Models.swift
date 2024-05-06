
import Foundation

// Course Type
enum CourseType {
    case levelA
    case levelB
    case levelC
}

// Courses
struct Course {
    var id: UUID
    var name: String
    var type: CourseType
    var assessments: [Assessment]
    var videoLectures: [VideoLecture]
    var isCompleted: Bool // completion status
}

// Video Lecture
struct VideoLecture {
    var id: UUID
    var name: String
    var courseId: UUID // ID of the course this video lecture belongs to
    var url: URL // URL of the video lecture
}

// Data model for Assessments
struct Assessment {
    var id: UUID
    var courseId: UUID // ID of the course this assessment belongs to
    var name: String
    var score: Int? // User's score in this assessment (optional for tracking incomplete assessments)
    var isCompleted: Bool // Track assessment completion status
}

// Data model for User
class User {
    var username: String
    var userEmail: String
    var password: String
    var courses: [Course]
    var assessments: [Assessment]
    
 
    init(username: String, userEmail: String, password: String, courses: [Course], assessments: [Assessment]) {
        self.username = username
        self.userEmail = userEmail
        self.password = password
        self.courses = courses
        self.assessments = assessments
    }
    
    // Completion of a specific course
    func hasCompletedCourse(courseId: UUID) -> Bool {
        if let course = courses.first(where: { $0.id == courseId }) {
            return course.isCompleted
        }
        return false
    }
    
    // user's score in a specific assessment
    func userScoreInAssessment(assessmentId: UUID) -> Int? {
        if let assessment = assessments.first(where: { $0.id == assessmentId }) {
            return assessment.score
        }
        return nil
    }
    
    // Check if the user has completed a specific assessment
    func hasCompletedAssessment(assessmentId: UUID) -> Bool {
        if let assessment = assessments.first(where: { $0.id == assessmentId }) {
            return assessment.isCompleted
        }
        return false
    }
}

func generateSampleData() -> (Course, Assessment, DailyActivityTracker, [VideoLecture]) {
    // course1
    let islCourse = Course(id: UUID(), name: "Indian Sign Language Course", type: .levelA, assessments: [], videoLectures: [], isCompleted: false)

    // assessment1
    let fingerspellingAssessment = Assessment(id: UUID(), courseId: islCourse.id, name: "Fingerspelling Test", score: nil, isCompleted: false)

    // daily activity tracker
    var dailyActivityTracker = DailyActivityTracker()

    // video lectures
    let basicGesturesVideo = VideoLecture(id: UUID(), name: "Basic Gestures", courseId: islCourse.id, url: URL(string: "https://example.com/basic_gestures_video")!)
    let numbersVideo = VideoLecture(id: UUID(), name: "Numbers in ISL", courseId: islCourse.id, url: URL(string: "https://example.com/numbers_video")!)

    // daily activities
    dailyActivityTracker.markActivityCompleted(forDay: "Monday")
    dailyActivityTracker.markActivityCompleted(forDay: "Tuesday")

    return (islCourse, fingerspellingAssessment, dailyActivityTracker, [basicGesturesVideo, numbersVideo])
}

// Generate data
let (islCourse, fingerspellingAssessment, dailyActivityTracker, videoLectures) = generateSampleData()


// Enum to represent activity completion status
enum ActivityStatus {
    case completed
    case incomplete
}

// Data model for daily activity
struct DailyActivity {
    var day: String // Day of the week (e.g., "Monday", "Tuesday", etc.)
    var status: ActivityStatus // Completion status of the activity for the day
}

// Data model for activity tracker for a week
struct DailyActivityTracker {
    var activities: [DailyActivity] // Array to store daily activities
    
    // Initialize the activity tracker with default values
    init() {
        // Initialize with all activities set as incomplete
        activities = [
            DailyActivity(day: "Monday", status: .incomplete),
            DailyActivity(day: "Tuesday", status: .incomplete),
            DailyActivity(day: "Wednesday", status: .incomplete),
            DailyActivity(day: "Thursday", status: .incomplete),
            DailyActivity(day: "Friday", status: .incomplete),
            DailyActivity(day: "Saturday", status: .incomplete),
            DailyActivity(day: "Sunday", status: .incomplete)
        ]
    }
    
    // Function to mark an activity as completed for a specific day
    mutating func markActivityCompleted(forDay day: String) {
        if let index = activities.firstIndex(where: { $0.day == day }) {
            activities[index].status = .completed
        }
    }
}


