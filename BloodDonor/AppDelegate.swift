// Import the UIKit framework
import UIKit

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
        let userVC = UserViewController()
        let addDonationVC = AddDonationViewController()
        let donationsVC = DonationsViewController()
        let mapVC = MapViewController()
        
        // Create instances of the UINavigationController class with each view controller as its root view controller
        let homeNC = UINavigationController(rootViewController: homeVC)
        let userNC = UINavigationController(rootViewController: userVC)
        let addDonationNC = UINavigationController(rootViewController: addDonationVC)
        let donationsNC = UINavigationController(rootViewController: donationsVC)
        let mapNC = UINavigationController(rootViewController: mapVC)
        
        // Create an instance of the UITabBarController class
        let tabBarController = UITabBarController()
        
        // Set the view controllers of the tab bar controller to the navigation controllers created earlier
        tabBarController.viewControllers = [homeNC, userNC, addDonationNC, donationsNC, mapNC]
        
        // Create instances of UITabBarItem and set their properties
        let tabBarItemHome = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        let tabBarItemUser = UITabBarItem(title: "User", image: UIImage(systemName: "person.fill"), tag: 1)
        let tabBarItemAddDonation = UITabBarItem(title: "Add donation", image: UIImage(systemName: "plus.circle.fill"), tag: 2)
        let tabBarItemDonations = UITabBarItem(title: "Donations", image: UIImage(systemName: "list.bullet.rectangle.portrait.fill"), tag: 3)
        let tabBarItemMap = UITabBarItem(title: "Map", image: UIImage(systemName: "mappin.and.ellipse"), tag: 4)
        
        // Set the tab bar controller's tint color and translucency properties
        tabBarController.tabBar.tintColor = UIColor.systemBlue
        tabBarController.tabBar.isTranslucent = false
        
        // Set the tab bar items of each navigation controller
        homeNC.tabBarItem = tabBarItemHome
        userNC.tabBarItem = tabBarItemUser
        addDonationNC.tabBarItem = tabBarItemAddDonation
        donationsNC.tabBarItem = tabBarItemDonations
        mapNC.tabBarItem = tabBarItemMap
        
        // Set the root view controller of the window to the tab bar controller
        window?.rootViewController = tabBarController
        
        // Return true to indicate that the app launched successfully
        return true
    }
}
