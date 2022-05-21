//
//  GroupModel.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 21.05.2022.
//

import Foundation

struct GroupModel: Identifiable {
    let id = UUID()
    let groupName: String
    let groupImage: String
}

let groupData = [
    GroupModel(groupName: "Barbados", groupImage: "Barbados"),
    GroupModel(groupName: "Central Perk", groupImage: "CentralPerk")
    ]
