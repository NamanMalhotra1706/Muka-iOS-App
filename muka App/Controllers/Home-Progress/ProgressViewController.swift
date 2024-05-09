import UIKit

class ProgressViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Create a newView
        let newView = UIView(frame: CGRect(x: 0, y: 500, width: self.view.frame.width, height: self.view.frame.width))
        newView.backgroundColor = .white
        
        // Create label for progress
        let label = UILabel(frame: CGRect(x: 40, y: 10, width: newView.frame.width - 40, height: 50))
        label.text = "Your Progress"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        newView.addSubview(label)
        
        // Create label for completion status
        let completedLabel = UILabel(frame: CGRect(x: 40, y: 160, width: newView.frame.width - 40, height: 50))
        completedLabel.text = "39 out of 52 completed"
        completedLabel.textColor = .black
        completedLabel.textAlignment = .left
        completedLabel.font = UIFont.boldSystemFont(ofSize: 10)
        newView.addSubview(completedLabel)
        
        
        let lineView = UIView(frame: CGRect(x: 0, y: 215, width: newView.frame.width, height: 1))
        
        lineView.backgroundColor = .lightGray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        newView.addSubview(lineView)
        
        
        // Create close button
        let closeButton = UIButton(type: .system)
        closeButton.frame = CGRect(x: 20, y:220, width: newView.frame.width - 40, height: 50)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.blue, for: .normal) // Set text color to blue
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        newView.addSubview(closeButton)
        
        // Add newView to the main view
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(newView)
        
        // Set presentation style to full screen
        modalPresentationStyle = .fullScreen
    }
    
    @objc func closeButtonTapped() {
        // Dismiss the presented view controller
        self.dismiss(animated: true, completion: nil)
    }
}
