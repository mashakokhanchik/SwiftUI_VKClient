//
//  GroupsView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 21.05.2022.
//

import SwiftUI

//struct GroupsView: View {
//    
//    // MARK: - Properties
//    
//    var groups: [GroupModel] = []
//    
//    // MARK: - Body view
//    
//    var body: some View {
//        //NavigationView {
//            List(groups.sorted(by: { $0.groupName < $1.groupName})) { group in
//                NavigationLink(destination: GroupsView(groups: groups)) {
//                    AvatarImageViewBuilder {
//                        Image(group.groupImage)
//                    }
//                    TextBuilder {
//                        Text(group.groupName)
//                    }
//                }
//            }
//            .navigationTitle("Groups")
//            .navigationBarTitleDisplayMode(.inline)
//            //Spacer()
//        }
//    //}
//    
//}
//
//// MARK: - Screen content view
//
//struct GroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsView(groups: groupData)
//    }
//}
