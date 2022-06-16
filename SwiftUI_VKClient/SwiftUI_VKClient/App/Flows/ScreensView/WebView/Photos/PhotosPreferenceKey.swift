//
//  PhotosPreferenceKey.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 11.06.2022.
//

import SwiftUI

struct PhotosHeightPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
    
}

struct PhotosSelectionPreferenceKey: PreferenceKey {
    
    static var defaultValue: Anchor<CGRect>? = nil
    
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = value ?? nextValue()
    }
    
}
