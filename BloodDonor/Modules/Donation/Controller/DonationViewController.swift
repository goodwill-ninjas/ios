import UIKit
import SwiftUI

class AddDonationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colorWhite = UIColor(red: 253, green: 251, blue: 247, alpha: 1)
        view.backgroundColor = colorWhite
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showActionSheet()
    }
    
    private func showActionSheet() {
        let actionView = UIAlertController(title: "Dodaj wpis do dziennika", message: nil, preferredStyle: .actionSheet)
        actionView.addAction(UIAlertAction(title: "❤️ Dodaj donację", style: .default, handler: openDonationDetails))
        actionView.addAction(UIAlertAction(title: "💔 Dyskwalifikacja", style: .default, handler: openDisqualificationDetails))
        actionView.addAction(UIAlertAction(title: "Anuluj", style: .cancel))
        
        if let tabBarController = self.tabBarController {
            actionView.popoverPresentationController?.sourceView = tabBarController.tabBar
            actionView.popoverPresentationController?.sourceRect = tabBarController.tabBar.bounds
        }
        
        present(actionView, animated: true, completion: nil)
    }
    
// POSSIBLE REFACTOR
    
    private func openDonationDetails(action: UIAlertAction) {
        let donationView = DonationView()
        let hostingController = UIHostingController(rootView: donationView)
        present(hostingController, animated: true, completion: nil)
    }
    
    private func openDisqualificationDetails(action: UIAlertAction) {
        let disqualificationView = DisqualificationView()
        let hostingController = UIHostingController(rootView: disqualificationView)
        present(hostingController, animated: true, completion: nil)
    }
}
