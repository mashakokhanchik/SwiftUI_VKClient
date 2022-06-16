//
//  PhotosViewCell.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 11.06.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotosViewCell: View {
    
    // MARK: - Properties
    
    var photos: PhotosModel
    let index: Int?
    @Binding var selection: Int?
    
    // MARK: - Body view
    
    var body: some View {
        return GeometryReader { proxy in
            VStack {
                WebImage(url: URL(string: photos.url))
                    .resizable()
                    .frame(width: proxy.size.width, height: proxy.size.width/2)
                    .scaledToFill()
                Spacer().frame(width: proxy.size.width)
                
                LikeButton()
                    .frame(width: proxy.size.width)
            }
            .aspectRatio(1, contentMode: .fill)
            .preference(key: PhotosHeightPreferenceKey.self, value: proxy.size.width/1.5)
            .anchorPreference(key: PhotosSelectionPreferenceKey.self, value: .bounds) {
                index == self.selection ? $0 : nil
            }
            .onTapGesture {
                withAnimation(.default) {
                    self.selection = index
                }
            }
        }
    }
}

