// Import the UIKit framework
import UIKit
import SwiftUI

// Define the AppDelegate class which conforms to the UIApplicationDelegate protocol
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // Declare an optional window property of type UIWindow
    var window: UIWindow?
    
    // Implement the application(_:didFinishLaunchingWithOptions:) method of the UIApplicationDelegate protocol
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Create a new UIWindow object and set its size to the size of the screen
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Make the window visible
        window?.makeKeyAndVisible()
        
        // Set the background color of the window to the system background color
        window?.backgroundColor = .systemBackground
        
        // Create instances of the HomeViewController, UserViewController, AddDonationViewController, DonationsViewController, and MapViewController classes
        let homeVC = HomeViewController()
        
        let modal = BloodTypeModal.bloodTypes[0]
        let child = UIHostingController(rootView: NextDonationView(modal: modal))
        child.view.translatesAutoresizingMaskIntoConstraints = false // Disable autoresizing mask translation into constraints
//        child.view.frame = homeVC.view.bounds
        homeVC.view.addSubview(child.view)
        homeVC.addChild(child)
        child.didMove(toParent: homeVC)
        
        NSLayoutConstraint.activate([
            child.view.topAnchor.constraint(equalTo: homeVC.view.topAnchor),
            child.view.leadingAnchor.constraint(equalTo: homeVC.view.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: homeVC.view.trailingAnchor),
            child.view.bottomAnchor.constraint(equalTo: homeVC.view.bottomAnchor),
        ])
        
        let donationsVC = DonationsViewController()
        let addDonationVC = AddDonationViewController()
        let mapVC = MapViewController()
        let userVC = UserViewController()
        
        // Create instances of the UINavigationController class with each view controller as its root view controller
        let homeNC = UINavigationController(rootViewController: homeVC)
        let donationsNC = UINavigationController(rootViewController: donationsVC)
        let addDonationNC = UINavigationController(rootViewController: addDonationVC)
        let mapNC = UINavigationController(rootViewController: mapVC)
        let userNC = UINavigationController(rootViewController: userVC)
        
        // Create an instance of the UITabBarController class
        let tabBarController = UITabBarController()
        
        // Set the view controllers of the tab bar controller to the navigation controllers created earlier
        tabBarController.viewControllers = [homeNC, donationsNC, addDonationNC, mapNC, userNC]
        
        // Create instances of UITabBarItem and set their properties
        let tabBarItemHome = UITabBarItem(title: "Panel", image: UIImage(systemName: "house.fill"), tag: 0)
        let tabBarItemDonations = UITabBarItem(title: "Donacje", image: UIImage(systemName: "list.bullet.rectangle.portrait.fill"), tag: 1)
        let tabBarItemAddDonation = UITabBarItem(title: "Dodaj wpis", image: UIImage(systemName: "plus.circle.fill"), tag: 2)
        let tabBarItemMap = UITabBarItem(title: "Placówki", image: UIImage(systemName: "mappin.and.ellipse"), tag: 3)
        let tabBarItemUser = UITabBarItem(title: "Profil", image: UIImage(systemName: "person.fill"), tag: 4)
        
        // Set the tab bar controller's tint color and translucency properties
        tabBarController.tabBar.tintColor = UIColor.systemBlue
        tabBarController.tabBar.isTranslucent = false
        
        // Set the tab bar items of each navigation controller
        homeNC.tabBarItem = tabBarItemHome
        donationsNC.tabBarItem = tabBarItemDonations
        addDonationNC.tabBarItem = tabBarItemAddDonation
        mapNC.tabBarItem = tabBarItemMap
        userNC.tabBarItem = tabBarItemUser
        
        // Set the root view controller of the window to the tab bar controller
        window?.rootViewController = tabBarController
        
        // Return true to indicate that the app launched successfully
        return true
    }
}
