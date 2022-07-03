//
//  SceneDelegate.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 02.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        func createHabitsViewController() -> UINavigationController {
            let habitsVC = HabitsViewController()
            habitsVC.tabBarItem = UITabBarItem(title: "Привычки",
                                                         image: UIImage(named: "Shape-2"),
                                                         tag: 0)
            //habitsVC.navigationBar.prefersLargeTitles = true
            return UINavigationController(rootViewController: habitsVC)
        }
        
        func createInfoViewController() -> UINavigationController {
            let infoVC = InfoViewController()
            infoVC.tabBarItem = UITabBarItem(title: "Информация",
                                             image: UIImage(systemName: "info.circle.fill"),
                                             tag: 1)
            return UINavigationController(rootViewController: infoVC)
        }
            
            func createTabBarController() -> UITabBarController {
                
                let tabBarController = UITabBarController()
                //UITabBar.appearance().backgroundColor = .systemGray5
                tabBarController.tabBar.tintColor = .purpleColor
                tabBarController.viewControllers = [createHabitsViewController(), createInfoViewController()]
                return tabBarController
            }
        
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }
}

