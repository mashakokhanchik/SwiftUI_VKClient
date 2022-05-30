//
//  FriendsWebView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 29.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct FriendsWebView: View {
    
    @ObservedObject var viewModel: FriendsViewFactory
    
    init(viewModel: FriendsViewFactory) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.friends.sorted(by: { $0.fullName < $1.fullName}), id: \.id) { friend in
            NavigationLink(destination: PhotosWebView(viewModel: PhotosViewFactory(service: PhotosServiceRequest(), friend: friend))) {
                AvatarImageViewBuilder {
                    WebImage(url: URL(string: friend.avatarImage))
                }
                TextBuilder {
                    Text(friend.fullName)
                }
            }
        }
        .onAppear { viewModel.fetch() }
        .navigationTitle("Friends")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FriendsWebView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsWebView(viewModel: FriendsViewFactory(service: FriendsServiceRequest()))
    }
}
