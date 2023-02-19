import UIKit

class MapViewController: MainViewController {
    override func viewDidLoad() {
        let colorWhite = UIColor(red: 253, green: 251, blue: 247, alpha: 1)
        view.backgroundColor = colorWhite
        title = "Destinations"
        setupNavBar()
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "mappin.and.ellipse", title: "Destinations", tag: 5)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Find the nearest blood donation center:"
    }
}
