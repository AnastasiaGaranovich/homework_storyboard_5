import UIKit

class BackgroundViewController: UIViewController, ChangingViewControllerDelegate {
    
    func didPressButton(color: UIColor) {
        self.view.backgroundColor = color
    }
    
    @IBAction func changeBackgroundButtonPressed(_ sender: UIButton) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ChangingViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
