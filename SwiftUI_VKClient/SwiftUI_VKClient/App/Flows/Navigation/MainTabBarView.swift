//
//  MainTabBarView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 22.05.2022.
//

import SwiftUI

struct MainTabBarView: View {
    
    // MARK: - Body view
    
    var body: some View {
        TabView {
            FriendsWebView(viewModel: FriendsViewModel(service: FriendsServiceRequest()))
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Friends")
                }
            GroupsWebView(viewModel: GroupsViewModel(service: GroupsServiceRequest(), coreDataService: CoreDataService(modelName: "ModelCoreData")))
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Groups")
                }
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
        }
    }

}

// MARK: - Screen content view

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
