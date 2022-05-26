//
//  SectionDataModel.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 26.05.2022.
//

import Foundation

struct SectionDataNodel: Identifiable {
    
    var id: String {
        return letter
    }
    
    let letter: String
}

extension SectionDataNodel: Equatable {
    static func == (lhs: SectionDataNodel, rhs: SectionDataNodel) -> Bool {
        return lhs.letter == rhs.letter
    }
}
