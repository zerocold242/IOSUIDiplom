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
        
        
        func createHabitsNC() -> UINavigationController {
            let habitsVC = HabitsViewController()
            let habitsNC = UINavigationController(rootViewController: habitsVC)
            habitsNC.navigationBar.tintColor = .purpleColor
            habitsVC.tabBarItem = UITabBarItem(title: "Привычки",
                                               image: UIImage(named: "Shape-2"),
                                               tag: 0)
            return habitsNC
        }
        
        func createInfoNC() -> UINavigationController {
            let infoVC = InfoViewController()
            infoVC.tabBarItem = UITabBarItem(title: "Информация",
                                             image: UIImage(systemName: "info.circle.fill"),
                                             tag: 1)
            return UINavigationController(rootViewController: infoVC)
        }
        
        func createTabBarController() -> UITabBarController {
            let tabBarController = UITabBarController()
            UITabBar.appearance().backgroundColor = .navigationColor
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
            UITabBar.appearance().isTranslucent = true
            tabBarController.tabBar.tintColor = .purpleColor
            tabBarController.viewControllers = [createHabitsNC(), createInfoNC()]
            
            return tabBarController
        }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }
}

