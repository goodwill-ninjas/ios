import UIKit

class UserViewController: MainViewController {
    override func viewDidLoad() {
        let colorWhite = UIColor(red: 253, green: 251, blue: 247, alpha: 1)
        view.backgroundColor = colorWhite
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Your profile:"
    }
}
