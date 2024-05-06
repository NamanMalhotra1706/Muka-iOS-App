import UIKit

class CourseHomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Create an instance of CourseDataModel
    let courseDataModel = CourseDataModel()

    
    // Define a property to hold the array of courses
    var courses: [CourseHome] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        courses = courseDataModel.sampleCourses
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CourseHomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .disclosureIndicator {
                    performSegue(withIdentifier: "CourseDetailPage", sender: nil)
                } else {
                    print("Tapped a row without disclosure indicator")
                }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Deselect the selected row
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
    
    @objc func takeAssessmentButtonTapped(_ sender: UIButton) {
            guard let cell = sender.superview?.superview as? CourseTableViewCell,
                  let indexPath = tableView.indexPath(for: cell) else {
                return
            }
            performSegue(withIdentifier: "takeQuiz", sender: indexPath)
        }
    
}

extension CourseHomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of courses
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! CourseTableViewCell
        
       let course = courses[indexPath.row]
        
        // Set data for each outlet in the custom cell
        cell.courseIcon.image = UIImage(named: "common_course_icon")
        cell.courseTitle.text = course.courseName
        // Set other properties accordingly
        
        switch course.status {
        case .completed:
            cell.courseProgressIcon.image = UIImage(named: "badge_icon")
            cell.courseStatus.text = "Course complete"
        
        case .takeAssessment:
            cell.courseStatus.isHidden = true
            cell.takeAssessmentButton.isHidden = false
            cell.courseProgressIcon.image = UIImage(named: "confirmation")
        
        case .inProgress:
            cell.courseStatus.text = "Continue where you left..."
            break
            //cell.courseProgressIcon.image = UIImage(named: "arrow_icon")
        
        case .locked:
            cell.courseProgressIcon.image = UIImage(named: "lock_icon")

            cell.courseStatus.text = "Complete previous courses to unlock."
        }
        
        if course.hasDisclouserIndicator{
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
        }
        else{
            cell.accessoryType = .none
            cell.selectionStyle = .none
        }
        
        return cell
    }

}
