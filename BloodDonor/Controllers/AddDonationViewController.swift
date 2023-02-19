import UIKit

class AddDonationViewController: MainViewController {
    override func viewDidLoad() {
        let colorWhite = UIColor(red: 253, green: 251, blue: 247, alpha: 1)
        view.backgroundColor = colorWhite
        title = "Add Donation"
        setupNavBar()
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "plus.circle.fill", title: "Add", tag: 3)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Add donation!"
    }
}
