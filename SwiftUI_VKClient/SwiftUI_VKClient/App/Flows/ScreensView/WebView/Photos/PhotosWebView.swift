//
//  PhotosWebView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 29.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotosWebView: View {
    
    @ObservedObject var viewModel: PhotosViewFactory
    
    init(viewModel: PhotosViewFactory) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        let photosArray = viewModel.photos.chunked(into: 2)
//        return VStack {
//            ScrollView {
//                VStack(spacing: 16) {
//                    ForEach(photosArray.indices, id: \.self) { index in
//                        HStack {
//                            Spacer()
//                            WebImage(url: URL(string: (photosArray[index])))
//                                .resizable()
//                                .frame(width: 200, height: 200)
//                                .cornerRadius(10)
//                            Spacer()
//                        }
//                    }
//                }
//            }
        return VStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(photosArray.indices, id: \.self) { index1 in
                        HStack {
                            ForEach(photosArray[index1].indices, id: \.self) { index2 in
                                HStack {
                                    Spacer()
                                    WebImage(url: URL(string: photosArray[index1][index2]))
                                        .resizable()
                                        .frame(maxWidth: 200, maxHeight: 200)
                                        .cornerRadius(10)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
            .onAppear { viewModel.fetch() }
//            .navigationTitle("Photos")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

//struct PhotosWebView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosWebView(viewModel: PhotosViewFactory(service: PhotosServiceRequest(), friend: <#UserModel#>))
//    }
//}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
