import UIKit
import SwiftUI

class AddDonationViewController: MainViewController {
    override func viewDidLoad() {
        let colorWhite = UIColor(red: 253, green: 251, blue: 247, alpha: 1)
        view.backgroundColor = colorWhite
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let actionView = UIAlertController(title: "Dodaj wpis do dziennika", message: nil, preferredStyle: .actionSheet)
        actionView.addAction(UIAlertAction(title: "❤️ Dodaj donację", style: .default, handler: openDetails))
        actionView.addAction(UIAlertAction(title: "💔 Dyskwalifikacja", style: .default, handler: openDetails))
        actionView.addAction(UIAlertAction(title: "Anuluj", style: .cancel))
        
        // Set the popover presentation controller to show the action sheet from the tab bar item
        if let tabBarController = self.tabBarController {
            actionView.popoverPresentationController?.sourceView = tabBarController.tabBar
            actionView.popoverPresentationController?.sourceRect = tabBarController.tabBar.bounds
        }
        
        present(actionView, animated: true, completion: nil)
    }
    
    func openDetails(action: UIAlertAction) {
        let formSwiftUIViewController = FormSwiftUIViewController()
        let hostingController = UIHostingController(rootView: formSwiftUIViewController)
        present(hostingController, animated: true, completion: nil)
    }
    
}
