//
//  FriendsView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 20.05.2022.
//

import SwiftUI

struct FriendsView: View {
    
    // MARK: - Properties
    
    var friends: [UserModel] = []
    
    // MARK: - Body view
    
    var body: some View {
        List(friends) { friend in
            HStack {
                AvatarImageViewBuilder {
                    Image(friend.avatarImage)
                }
                TextBuilder {
                    Text(friend.fullName)
                }
            }
        }
    }
    
}

// MARK: - Screen content view

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
            FriendsView(friends: userData)
        
    }
}


