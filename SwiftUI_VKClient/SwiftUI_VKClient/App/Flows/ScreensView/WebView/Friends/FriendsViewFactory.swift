//
//  FriendsViewFactory.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 29.05.2022.
//

import Foundation

class FriendsViewFactory: ObservableObject {
    
    let service: FriendsService
    @Published var friends: [UserModel] = []
    
    init(service: FriendsService) {
        self.service = service
    }
    
    public func fetch() {
        service.getFriends { [weak self] friends in
            guard let self = self else { return }
            self.friends = self.fillFriendsArray(friends!)
        }
    }
    
    func fillFriendsArray(_ friendsResponse: FriendsResponse) -> [UserModel] {
        var friendsArray: [UserModel] = []
        let friendsCount = friendsResponse.response.items.count
        let friends = friendsResponse.response.items
        for i in 0...friendsCount - 1 {
            friendsArray.append(UserModel(fullName: (friends[i].lastName),
                                          avatarImage: (friends[i].photo100)!,
                                          friendPhotos: (friends[i].id)))
        }
        return(friendsArray)
    }
}
