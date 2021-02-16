import UIKit

class BackgroundViewController: UIViewController, ChangingViewControllerDelegate {
    
    @IBOutlet weak var backgroundView: UIView!
    
    func didPressButton(color: UIColor) {
        backgroundView.backgroundColor = color
    }
    
    @IBAction func changeBackgroundButtonPressed(_ sender: UIButton) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ChangingViewController") as! ChangingViewController
        viewController.delegate = self
        viewController.color = backgroundView.backgroundColor
        navigationController?.pushViewController(viewController, animated: true)
    }
}
