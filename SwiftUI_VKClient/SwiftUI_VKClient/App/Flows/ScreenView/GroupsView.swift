//
//  GroupsView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 21.05.2022.
//

import SwiftUI

struct GroupsView: View {
    
    // MARK: - Properties
    
    var groups: [GroupModel] = []
    
    // MARK: - Body view
    
    var body: some View {
        List(groups) { group in
            HStack {
                AvatarImageViewBuilder {
                    Image(group.groupImage)
                }
                TextBuilder {
                    Text(group.groupName)
                }
            }
        }
    }
    
}

// MARK: - Screen content view

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView(groups: groupData)
    }
}
