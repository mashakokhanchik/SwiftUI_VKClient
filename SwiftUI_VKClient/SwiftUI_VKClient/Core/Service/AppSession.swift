//
//  AppSession.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 27.05.2022.
//

import Foundation

class AppSession: ObservableObject {
    
    static let shared = AppSession()
    
    private init() {}
    
    @Published var isAutorized: Bool = false
    @Published var token = ""
    @Published var userId = ""
    @Published var version = "5.131"
    @Published var clientId = "7822904"
    
}
