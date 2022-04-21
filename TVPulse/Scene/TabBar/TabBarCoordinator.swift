//
//  TabBarCoordinator.swift
//  TVPulse
//
//  Created by Maxime Maheo on 21/04/2022.
//

import UIKit.UINavigationController
import UIKit.UITabBarController
import TPCore

final class TabBarCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    var children: [CoordinatorProtocol] = []
    var parentCoordinator: CoordinatorProtocol?

    private let window: UIWindow
    private let tabBarController = UITabBarController()
    private let appDIContainer: AppDIContainer

    private enum Tab {
        case watchList
    }
    
    // MARK: - Lifecycle
    
    init(window: UIWindow,
         appDIContainer: AppDIContainer) {
        self.window = window
        self.appDIContainer = appDIContainer
    }
    
    // MARK: - Methods
    
    func start() {
        add(tab: .watchList)
        
        window.updateRootViewController(with: tabBarController)
    }
    
    func stop() { fatalError("Should not be stopped.") }
    
    // MARK: - Private methods
    
    private func add(tab: Tab) {
        let navigationController = UINavigationController()
        
        var viewControllers = tabBarController.viewControllers ?? []
        viewControllers += [navigationController]
        
        tabBarController.setViewControllers(viewControllers, animated: true)
        
        let coordinator: CoordinatorProtocol
        
        switch tab {
        case .watchList:
            coordinator = appDIContainer
                .watchListSceneDIContainer
                .makeCoordinator(navigationController: navigationController)
            
            let tabBarItem = UITabBarItem(title: "Watch list",
                                          image: UIImage(systemName: "square.grid.2x2"),
                                          selectedImage: nil)
            navigationController.tabBarItem = tabBarItem
        }
        
        children.append(coordinator)
        coordinator.start()
    }
}
