import UIKit

class ChallengesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var currentWeekCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var challenges: [Challenge] = []
    var userProfile: UserProfile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(challengesQuizTableViewCell.self, forCellReuseIdentifier: "QuizTableViewCell")
        
        challenges = levelBChallenge.intermediateChallenges
        
        userProfile = user.sampleUsers[0]
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.showsVerticalScrollIndicator = false
        
        
      
            currentWeekCollectionView.dataSource = self
            currentWeekCollectionView.delegate = self
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of challenges completed for the current week
        return userProfile?.challengesCompleted.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentWeekCVC", for: indexPath) as! CurrentWeekCollectionViewCell
        
        // Assuming challengesCompleted is an array of Challenge objects
        if let challenge = userProfile?.challengesCompleted[indexPath.item] {
            // Configure the cell with challenge data
            cell.titleLabel.text = challenge.title
            cell.scoreLabel.text = "Score: \(challenge.scoredMarks)/\(challenge.totalMarks)"
            cell.imageView.image = challenge.image
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "takeAChallenge",
           let takeChallenegVC = segue.destination as? TakeChallenegeViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            
            // Assuming you have an array of challenges in your data source
            let selectedChallenge = challenges[indexPath.row]
            takeChallenegVC.recievedChallenegeName = selectedChallenge.title
            
            takeChallenegVC.recievedChallenegeDescription = selectedChallenge.description
            
            takeChallenegVC.recievedChallengeImage = selectedChallenge.image
        
                }
        //=====================================================
       
        
        }
        
    }
    
    

