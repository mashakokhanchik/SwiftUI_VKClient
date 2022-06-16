//
//  PhotosViewModel.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 29.05.2022.
//

import Foundation

class PhotosViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let service: PhotosService
    let friend: UserModel
    
    @Published var photos: [PhotosModel] = []
    
    // MARK: - Inits
    
    init(service: PhotosService, friend: UserModel) {
        self.service = service
        self.friend = friend
    }
    
    // MARK: - Methods
    
    public func fetch() {
        service.getPhotos(userId: friend.friendPhotos) { [weak self] photos in
            self?.photos = (self?.fillPhotosArray(photos))!
        }
    }
    
    private func fillPhotosArray(_ photosResponse: PhotosResponse) -> [PhotosModel] {
        var photosArray: [PhotosModel] = []
        let photosCount = photosResponse.response.items.count
        let photos = photosResponse.response.items
        
        if photosCount > 1 {
            for i in 0...photosCount - 1 {
                photosArray.append(PhotosModel(url: "\(photos[i].sizes[6].url)"))
            }
        }
        return(photosArray)
    }
}
