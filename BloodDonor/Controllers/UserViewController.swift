import UIKit

class UserViewController: MainViewController {
    override func viewDidLoad() {
        let colorWhite = UIColor(red: 253, green: 251, blue: 247, alpha: 1)
        view.backgroundColor = colorWhite
        title = "Profile"
        setupNavBar()
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "person.fill", title: "Profile", tag: 2)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Your profile:"
    }
}
