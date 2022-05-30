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
    
    // MARK: - Private methods
    
    private func arrayLetter() -> [SectionDataNodel] {
        var resultArray = [SectionDataNodel]()
        for friend in friends {
            let nameLetter = String(friend.fullName.prefix(1))
            let letterModel = SectionDataNodel(letter: nameLetter)
            if !resultArray.contains(letterModel) {
                resultArray.append(letterModel)
            }
        }
        resultArray = resultArray.sorted(by: { $0.letter < $1.letter})
        return resultArray
    }
    
    private func arrayByLetter(_ letter: String) -> [UserModel] {
        var resultArray = [UserModel]()
        for friend in friends {
            let nameLetter = String(friend.fullName.prefix(1))
            if nameLetter == letter {
                resultArray.append(friend)
            }
        }
        return resultArray
    }
    
    // MARK: - Body view
    
    var body: some View {
        NavigationView {
            List(arrayLetter(), rowContent: { section in
                Section(header: Text("\(section.letter)")) {
                    ForEach(arrayByLetter(section.letter)) { friend in
                        NavigationLink (destination: FriendPhotoView(friends: friend)) {
                            AvatarImageViewBuilder {
                                Image(friend.avatarImage)
                            }
                            TextBuilder {
                                Text(friend.fullName)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("Friends")
                }
            })
        }
    }
    
}

// MARK: - Screen content view

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(friends: userData)
    }
}


