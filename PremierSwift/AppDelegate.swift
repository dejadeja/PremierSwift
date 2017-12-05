import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    //MARK: - Properties
    var window: UIWindow?

    //MARK: - UIApplicationDelegate Implementation
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataStack.saveContext()
    }
}
