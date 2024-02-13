//
//  BankManagerUIApp - SceneDelegate.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = Self.makeViewController()
        self.window?.makeKeyAndVisible()
    }
    
    static func makeViewController() -> UIViewController {
        let clientManagers: [BankTask: ClientManager] = [
            .loan: ClientManager(),
            .deposit: ClientManager(),
        ]
        
        let orders: [BankTask: Int] = [.loan: 1, .deposit: 2]
        
        let bankers = makeBankers(
            tasks: clientManagers,
            orders: orders
        )
        
        let bankManager = BankManager(
            bankers: bankers,
            clientManagers: clientManagers
        )
        
        bankers.forEach { banker in banker.delegate = bankManager }
        
        for (_, clientManager) in clientManagers {
            clientManager.delegate = bankManager
        }
        
        let mirror = BankViewModel(bankManager: bankManager)
        bankManager.delegate = mirror
        
        let viewController = BankViewController(bankMirror: mirror)
        mirror.delegate = viewController
        return viewController
    }
    
    static func makeBankers(
        tasks: [BankTask: ClientQueueManagable],
        orders: [BankTask: Int]
    ) -> [Banker] {
        var result = [Banker]()
        for (type, bankerCount) in orders {
            (1...bankerCount).forEach { _ in
                guard let clientManager = tasks[type] else { return }
                let banker = Banker(clientManager: clientManager)
                result.append(banker)
            }
        }
        return result
    }
}

