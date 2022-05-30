//
//  PhotosService.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 27.05.2022.
//

import Foundation
import SwiftUI
import Alamofire

protocol PhotosService {
    func getPhotos(userId: Int, completion: @escaping (PhotosResponse) -> ())
}

class PhotosServiceRequest: PhotosService {

    @ObservedObject var session = AppSession.shared
    
    let baseUrl = "https://api.vk.com/method"
    var parameters: Parameters = [:]
    var request: String?
    
    func getPhotos(userId: Int, completion: @escaping (PhotosResponse) -> ()) {
        let method = "/photos.getAll"
        let url = baseUrl + method
        
        self.parameters = [
            "owner_Id": ("\(userId)"),
            "access_token": session.token,
            "v": session.version
        ]
        
        parameters["count"] = "100"
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            self.request = response.request?.description
            guard let data = response.data else { return }
            
            do {
                let photos = try JSONDecoder().decode(PhotosResponse.self, from: data)
                completion(photos)
            } catch {
                print(error)
            }
        }
    }
    
}
