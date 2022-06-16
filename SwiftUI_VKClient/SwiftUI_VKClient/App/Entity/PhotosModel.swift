//
//  PhotosModel.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 11.06.2022.
//

import Foundation

struct PhotosModel: Identifiable, Equatable {
    
    let id: UUID = UUID()
    var url: String
    
    static func == (lhs: PhotosModel, rhs: PhotosModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}
