//
//  FriendPhotoView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 24.05.2022.
//

import SwiftUI

//struct FriendPhotoView: View {
//    
//    // MARK: - Properties
//    
//    var friends: UserModel
//    
//    // MARK: - Body view
//
//    var body: some View {
//        
//        let photosArray = friends.friendPhotos
//        
//        return VStack {
//            ScrollView {
//                VStack(spacing: 20) {
//                    ForEach(photosArray.indices, id:\.self) { index in
//                        HStack {
//                            Spacer()
//                            Image("\(photosArray[index])")
//                                .resizable()
//                                .frame(width: 200, height: 200)
//                                Spacer()
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//}
//
//// MARK: - Screen content view
//
//struct FriendPhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendPhotoView(friends: userData.first!)
//    }
//}
