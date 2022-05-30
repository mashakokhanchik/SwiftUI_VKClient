//
//  GroupsService.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 27.05.2022.
//

import Foundation
import SwiftUI
import Alamofire

protocol GroupsService {
    func getGroups(completion: @escaping(GroupsResponse?) -> ())
}

class GroupsServiceRequest: GroupsService {

    @ObservedObject var session = AppSession.shared
    let baseUrl = "https://api.vk.com/method"
    var parameters: Parameters = [:]
    var request: String?
    
    func getGroups(completion: @escaping (GroupsResponse?) -> ()) {
        let method = "/groups.get"
        let url = baseUrl + method
        
        self.parameters = [
            "client_Id": session.clientId,
            "user_Id": session.userId,
            "access_token": session.token,
            "v": session.version
        ]
        
        parameters["extended"] = "1"
        parameters["fields"] = "members_count, status"
        parameters["count"] = "50"
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            self.request = response.request?.description
            guard let data = response.data else { return }
            
            do {
                let groups = try JSONDecoder().decode(GroupsResponse.self, from: data)
                completion(groups)
            } catch {
                print(error)
            }
        }
    }
    
}
