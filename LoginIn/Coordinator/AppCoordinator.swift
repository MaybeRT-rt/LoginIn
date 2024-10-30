//
//  AppCoordinator.swift
//  LoginIn
//
//  Created by Liz-Mary on 30.10.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var window: UIWindow?
    var navigationController: UINavigationController?
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        window?.rootViewController = loginVC
        window?.makeKeyAndVisible()
    }
    
    func goToTaskScreen() {
        let taskVC = TaskViewController()
        taskVC.coordinator = self
        navigationController?.setViewControllers([taskVC], animated: true)
        window?.rootViewController = navigationController
    }
    
}
