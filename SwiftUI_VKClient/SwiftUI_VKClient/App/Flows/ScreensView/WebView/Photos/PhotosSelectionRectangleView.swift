//
//  PhotosSelectionRectangleView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 11.06.2022.
//

import SwiftUI

struct PhotosSelectionRectangleView: View {
    
    // MARK: - Properties
    
    let anchor: Anchor<CGRect>?
    
    // MARK: - Body view
    
    var body: some View {
        GeometryReader { proxy in
            if let rect = self.anchor.map( { proxy[$0] } ) {
                Rectangle()
                    .fill(Color.clear)
                    .border(Color.blue, width: 2)
                    .offset(x: rect.minX, y: rect.minY)
                    .frame(width: rect.width, height: rect.height)
            }
        }
    }
    
}
