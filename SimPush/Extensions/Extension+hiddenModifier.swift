//
//  Extension+HiddenModifier.swift
//  SimPush
//
//  Created by Reza Khonsari on 4/5/20.
//  Copyright © 2020 Reza Khonsari. All rights reserved.
//

import SwiftUI

extension View {

    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        modifier(HiddenModifier(isHidden: hidden, remove: remove))
    }
}


fileprivate struct HiddenModifier: ViewModifier {

    private let isHidden: Bool
    private let remove: Bool

    init(isHidden: Bool, remove: Bool = false) {
        self.isHidden = isHidden
        self.remove = remove
    }

    func body(content: Content) -> some View {
        Group {
            if isHidden {
                if remove {
                    EmptyView()
                } else {
                    content.hidden()
                }
            } else {
                content
            }
        }
    }
}
