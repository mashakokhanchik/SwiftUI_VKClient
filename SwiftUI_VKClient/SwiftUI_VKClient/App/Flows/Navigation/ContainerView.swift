//
//  ContainerView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 22.05.2022.
//

import SwiftUI

struct ContainerView: View {
    
    // MARK: - Properties
    
    @State private var shouldShowMainView: Bool = false
    @ObservedObject var session = AppSession.shared
    
    // MARK: - Body view
    
    var body: some View {
        NavigationView {
            HStack {
                VKLoginWebView()
                NavigationLink(destination: MainTabBarView(), isActive: $session.isAutorized) {
                    EmptyView()
                }
                // Login without a network
//                LoginView(isUserLoggedIn: $shouldShowMainView)
//                NavigationLink(destination: MainTabBarView(), isActive: $shouldShowMainView) {
//                    EmptyView()
//                }
            }
        }
    }
}

// MARK: - Screen content view

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
