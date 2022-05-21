//
//  UserModel.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 20.05.2022.
//

import Foundation

struct UserModel: Identifiable {
    let id = UUID()
    let fullName: String
    let avatarImage: String 
}

let userData = [
    UserModel(fullName: "Monica Geller", avatarImage: "MAvatar"),
    UserModel(fullName: "Rashel Green", avatarImage: "RAvatar"),
    UserModel(fullName: "Joe Tribbiani", avatarImage: "JAvatar"),
    UserModel(fullName: "Ross Geller", avatarImage: "RoAvatar")
    ]

