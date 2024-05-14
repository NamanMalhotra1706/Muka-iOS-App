muka - Indian Sign Language Learning App
muka is an iOS app designed to facilitate learning Indian Sign Language. The term "muka" originates from Sanskrit, referring to individuals who are deaf and mute. The app aims to enhance proficiency in Indian Sign Language through various features such as lessons, assessments, and practice sessions using camera recognition.

Features
1. Lessons Tab
LessonViewController: This tab allows users to browse through available lessons. Each lesson includes a title, description, duration, and a play button to watch the associated video.

2. Challenges Tab
ChallengesViewController: Users can access a variety of challenges to test their sign language skills. Challenges display titles, descriptions, difficulty levels, rewards, and progress indicators.

3. Practice Tab
PractiseTabViewController: This feature enables users to practice sign language using their device's camera. They can select images from the camera or photo library to practice recognition of numbers, alphabets, and more.

Technologies Used
Language: Swift
Frameworks: UIKit, AVKit

Models:
1.CourseHome.swift:
Contains the data model for courses within the Muka app.
Each course is represented by the CourseHome struct.
Encapsulates essential details such as course ID, name, status, icon, image, and lessons.
Defines the Status enum with possible states: "completed," "takeAssessment," "inProgress," and "locked."
Includes an array of CoursesLesson structs representing individual lessons within the course

2.CourseDataModel:
Provides methods for accessing sample courses, retrieving lessons within a course, and obtaining total counts of courses and lessons.
Facilitates the management and organization of course-related data, supporting various features and functionalities within the app.

3.User Profile Model:
CourseCompletionByUser:
Represents completion data for a course by a user.
Contains essential details such as course ID, name, badges earned, and medals earned by the user.
UserProfile:
Represents the user's profile.
Includes user ID, avatar, name, email, completed courses, challenges completed, and current enrolled course and lesson.
CurrentCourseEnrolled:
Represents the current course enrolled by the user.
Contains details such as title, total videos, user completed videos, and assessment completion status.
UserMedals and UserBadges:
Structures representing user medals and badges, including image and title.
User:
Class representing a user.
Provides methods for updating user information, accessing completed courses, badges earned, challenges completed, and managing user progress.
LessonManager:
Manages clicked lesson titles by users.
4.Assessments-Quiz: 
contains the implementation of a quiz feature within the application. It includes structures and classes to manage quiz questions, track user progress, and evaluate user responses.
Methods
- `checkAnswer(userAnswer: String) -> Bool`: Checks if the user's answer is correct.
- `getScore() -> Int`: Retrieves the user's score.
- `getTextQuestion() -> String`: Retrieves the text of the current question.
- `getProgress() -> Float`: Retrieves the progress of the quiz.
- `getImage() -> UIImage!`: Retrieves the image associated with the current question.
- `getNote() -> String`: Retrieves the additional note or explanation for the current question.
`nextQuestion() -> Bool`: Moves to the next question in the quiz.

5.Challenge:
Level A Challenges
Contains basic challenges suitable for beginners.
- `basicChallenges`: Array of basic challenges.
Level B Challenges
Contains intermediate challenges for users with some proficiency.
- `intermediateChallenges`: Array of intermediate challenges.
Level C Challenges
Contains advanced challenges for experienced users.
- `advancedChallenges`: Array of advanced challenges.
The challenges are structured based on difficulty levels, with each level containing challenges categorized by their difficulty. Use the provided structures and data to manage challenges within the application.

Controllers:

1.CourseHomeViewController:
Responsible for displaying the home screen of the course app, which includes details about the user's current working course, progress percentage, and a list of available courses. It also allows users to navigate to lesson details.
- `displayData()`: Method to display user's current working course name and progress.
- `viewWillAppear(_ animated:)`: Overridden method to update UI components when the view is about to appear.
- `tableView(_:numberOfRowsInSection:)`: Method to determine the number of rows in the table view.
- `tableView(_:cellForRowAt:)`: Method to configure and return a cell for a given row index.
- `tableView(_:didSelectRowAt:)`: Method called when a row is selected, used for navigation to lesson details.
- `prepare(for segue:, sender:)`: Method to prepare for navigation segue to lesson details.

2.ProfileViewController:
It is responsible for displaying the user's profile information, such as their avatar, name, and email address. Additionally, it provides functionality for users to edit their profile and access various settings.
- Display user profile: The table view controller retrieves the user's profile data and displays it, including their avatar, name, and email address.
- Edit profile: Users can edit their profile information by tapping on the "Edit" button.
Access settings: Users can access app and account settings through the profile view.
Dependencies
- UIKit: Provides fundamental UI components and functionality for iOS apps.
SafariServices: Allows for the presentation of web content within the app using Safari's rendering engine.

3.ChallengeViewController:
Features
- Challenge List: Displays a list of challenges categorized based on their difficulty level.
- Challenge Details: Each challenge item includes details such as title, description, difficulty level, rewards, and the user's progress.
- Challenge Interaction: Users can select a challenge to view more details and take on the challenge.
Current Week Challenges: Displays challenges completed by the user during the current week in a collection view.
Usage
1. View Challenges: Upon opening the Challenges section of the app, users can view a list of available challenges.
2. Select Challenge: Users can tap on a challenge to view its details and decide whether to take on the challenge.
3. Take Challenge: By selecting a challenge, users can access the challenge interface to attempt the challenge and earn rewards.
4. Track Progress: The Current Week Challenges collection view provides users with a summary of challenges completed during the current week.

4.LessonViewController
Features
- Course Details: Displays the selected course's title, description, number of lessons, and total duration.
- Lesson Videos: Lists lesson titles, durations, and provides a play button to watch the lesson videos.
- Assessment Button: Allows users to take assessments related to the course content.
Usage
1. View Course Details: Upon opening the Lesson View Controller, users can view details about the selected course, including its title, description, and duration.
2. Watch Lesson Videos: Users can browse through the list of lessons available in the course and tap on a lesson to watch its corresponding video.
3. Play Lesson Video: Upon tapping on a lesson, the video player interface opens, allowing users to watch the lesson video.
4. Take Assessment: Users can tap on the "Take Assessment" button to access assessments related to the course content.

