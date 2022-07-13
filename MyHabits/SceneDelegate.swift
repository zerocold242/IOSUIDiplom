//
//  SceneDelegate.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 02.07.2022.


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }
    
    private func createNavigationController(for rootViewController: UIViewController, with model: TabBarModel) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.tintColor = .purpleColor
        navigationController.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        navigationController.navigationBar.backgroundColor = .navigationColor
        navigationController.tabBarItem = UITabBarItem(title: model.title,
                                                       image: model.image,
                                                       tag: model.tag)
        return navigationController
    }
    
    private  func createTabBarController() -> UITabBarController {
        
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .navigationColor
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        UITabBar.appearance().isTranslucent = true
        tabBarController.tabBar.tintColor = .purpleColor
        tabBarController.viewControllers = [
            self.createNavigationController(for: HabitsViewController(), with: TabBarModel(title: "Привычки",                                                                                               image: UIImage(named: "Shape-2"),
                                                                                           tag: 0)),
            self.createNavigationController(for: InfoViewController(), with: TabBarModel(title: "Информация",
                                                                                         image: UIImage(systemName: "info.circle.fill"),
                                                                                         tag: 1))
        ]
        return tabBarController
    }
    
    struct TabBarModel {
        let title: String
        let image: UIImage?
        let tag: Int
    }
}

