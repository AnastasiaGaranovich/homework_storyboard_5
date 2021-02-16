import UIKit

class BackgroundViewController: UIViewController {
    
    var backColor: UIColor?
    
    @IBAction func changeBackgroundButtonPressed(_ sender: UIButton) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ChangingViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backColor
        backColor = self.view.backgroundColor
    }
}
