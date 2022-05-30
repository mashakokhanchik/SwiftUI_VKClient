//
//  PhotosViewFactory.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 29.05.2022.
//

import Foundation

class PhotosViewFactory: ObservableObject {
    
    let service: PhotosService
    let friend: UserModel
    
    @Published var photos: [String] = []
    
    init(service: PhotosService, friend: UserModel) {
        self.service = service
        self.friend = friend
    }
    
    public func fetch() {
        service.getPhotos(userId: friend.friendPhotos) { [weak self] photos in
            self?.photos = (self?.fillPhotosArray(photos))!
        }
    }
    
    func fillPhotosArray(_ photosResponse: PhotosResponse) -> [String] {
        var photosArray: [String] = []
        let photosCount = photosResponse.response.items.count
        let photos = photosResponse.response.items
        
        if photosCount > 1 {
            for i in 0...photosCount - 1 {
                photosArray.append(photos[i].sizes[6].url)
            }
        }
        return(photosArray)
    }
}