import UIKit

class ChallengesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var challenges: [Challenge] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(challengesQuizTableViewCell.self, forCellReuseIdentifier: "QuizTableViewCell")
        
        challenges = LevelBChallenges.intermediateChallenges
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizTableViewCell", for: indexPath) as! challengesQuizTableViewCell
        
        let challenge = challenges[indexPath.row]
        
        cell.quizTitle.text = challenge.title
        cell.quizDescription.text = challenge.description
        cell.difficulty.text = "\(challenge.difficulty)"
        cell.earnReward.text = "\(challenge.rewards)"
        cell.quizScore.text = "\(challenge.progress)/\(challenge.totalMarks)"
        
        let imageView = UIImageView(image: challenge.image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = cell.quizIcon.bounds
        cell.quizIcon.addSubview(imageView)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedChallenge = challenges[indexPath.row]
        
        performSegue(withIdentifier: "takeAChallenge", sender: selectedChallenge)
    }
    
}

