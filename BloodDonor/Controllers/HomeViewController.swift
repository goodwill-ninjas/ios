import UIKit

class HomeViewController: MainViewController {
    override func viewDidLoad() {
        let colorWhite = UIColor(red: 253, green: 251, blue: 247, alpha: 1)
        view.backgroundColor = colorWhite
        title = "Home"
        setupNavBar()
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Home", tag: 1)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Welcome back, User!"
    }
}
