import UIKit

class CourseHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var courses: [CourseHome] = CourseDataModel().getAllCourses()
    var selectedCourse: CourseHome?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
        
                // Deselect the selected row
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    tableView.deselectRow(at: selectedIndexPath, animated: true)
                }
            }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
                return 1
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as! CourseCell
        
        let course = courses[indexPath.row]
        //cell.configure(with: course)
        
        cell.courseIconImageView.image = UIImage(named: "common_course_icon")
                cell.courseNameLabel.text = course.courseName
                
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
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCourse = courses[indexPath.row]
       
        if tableView.cellForRow(at: indexPath)?.accessoryType == .disclosureIndicator {
                            performSegue(withIdentifier: "showLessonDetailSegue", sender: selectedCourse)
                        } else {
                            print("Tapped a row without disclosure indicator")
                        }
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLessonDetailSegue" {
            if let lessonViewController = segue.destination as? LessonViewController {
                lessonViewController.selectedCourse = selectedCourse
            }
        }
    }
}

