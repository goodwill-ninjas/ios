import UIKit

class DonationsViewController: MainViewController {
    override func viewDidLoad() {
        let colorWhite = UIColor(red: 253, green: 251, blue: 247, alpha: 1)
        view.backgroundColor = colorWhite
        title = "Your donations"
        setupNavBar()
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "list.bullet.rectangle.portrait.fill", title: "Donations", tag: 4)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Your donations:"
    }
}
