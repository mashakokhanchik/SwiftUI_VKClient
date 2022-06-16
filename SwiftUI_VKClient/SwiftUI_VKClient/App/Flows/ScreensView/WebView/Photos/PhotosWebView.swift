//
//  PhotosWebView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 29.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotosWebView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: PhotosViewModel
    
    private let columns: [GridItem] = [
        GridItem.init(.flexible(minimum: 0, maximum: .infinity)),
        GridItem.init(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    @State private var photoRowHeight: CGFloat? = nil
    @State private var selection: Int? = nil
    
    // MARK: - Inits
    
    init(viewModel: PhotosViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body view
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                    ForEach(viewModel.photos) { photo in
                        PhotosViewCell(photos: photo, index: viewModel.photos.firstIndex(of: photo), selection: $selection)
                                .frame(height: photoRowHeight)
                    }
                }
            }
        }
        .onAppear { viewModel.fetch() }
        .onPreferenceChange(PhotosHeightPreferenceKey.self) { height in
            photoRowHeight = height
        }
        .overlayPreferenceValue(PhotosSelectionPreferenceKey.self) {
            PhotosSelectionRectangleView(anchor: $0)
        }
    }
    
}



