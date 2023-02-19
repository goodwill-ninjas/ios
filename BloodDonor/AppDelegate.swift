import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let homeVC = HomeViewController()
        let userVC = UserViewController()
        let addDonationVC = AddDonationViewController()
        let donationsVC = DonationsViewController()
        let mapVC = MapViewController()
        
        let homeNC = UINavigationController(rootViewController: homeVC)
        let userNC = UINavigationController(rootViewController: userVC)
        let addDonationNC = UINavigationController(rootViewController: addDonationVC)
        let donationsNC = UINavigationController(rootViewController: donationsVC)
        let mapNC = UINavigationController(rootViewController: mapVC)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeNC, userNC, addDonationNC, donationsNC, mapNC]
        
        window?.rootViewController = tabBarController
        
        return true
    }



}

