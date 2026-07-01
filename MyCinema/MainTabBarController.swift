
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moviesVC = MoviesViewController()
        let ticketsVC = UIViewController()
        ticketsVC.view.backgroundColor = .white
        
        let moviesNavigationController = UINavigationController(rootViewController: moviesVC)
        
        moviesNavigationController.tabBarItem = UITabBarItem(title: "Films", image: UIImage(systemName: "film"), tag: 0)
        ticketsVC.tabBarItem = UITabBarItem(title: "My tickets", image: UIImage(systemName: "ticket"), tag:1)
        
        viewControllers = [moviesNavigationController, ticketsVC]
        
        tabBar.tintColor = .systemGray
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemBackground
            
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        } else {
            tabBar.backgroundColor = .systemBackground
        }
    }
}

