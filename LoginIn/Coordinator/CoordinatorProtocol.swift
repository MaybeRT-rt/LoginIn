//
//  CoordinatorProtocol.swift
//  LoginIn
//
//  Created by Liz-Mary on 30.10.2024.
//

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
