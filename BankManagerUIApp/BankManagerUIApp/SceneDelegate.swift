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
        let tasks: [BankTask: ClientQueueManagable] = [
            .loan: ClientManager(),
            .deposit: ClientManager(),
        ]
        
        let orders: [BankTask: Int] = [.loan: 2, .deposit: 3]
        
        let bankers = makeBankers(
            tasks: tasks,
            orders: orders
        )
        
        let bankManager = BankManager(
            bankers: bankers,
            clientManager: tasks
        )
        
        let mirror = BankMirror(bankManager: bankManager)
        let viewController = ViewController(bankMirror: mirror)
        return viewController
    }
    
    func startBank() {
        let tasks: [BankTask: ClientQueueManagable] = [
            .loan: ClientManager(),
            .deposit: ClientManager(),
        ]
        
        let orders: [BankTask: Int] = [.loan: 2, .deposit: 3]
        let bankers = Self.makeBankers(
            tasks: tasks,
            orders: orders
        )
        
        let bankManager = BankManager(
            bankers: bankers,
            clientManager: tasks
        )
    }
    
    static func makeBankers(
        tasks: [BankTask: any ClientQueueManagable],
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

