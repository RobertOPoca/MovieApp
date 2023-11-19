//
//  View+Extension.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 16/11/23.
//

import SwiftUI

extension View {
    @ViewBuilder
    func redacted(when condition: Bool) -> some View {
        if !condition {
            unredacted()
        } else {
            redacted(reason: .placeholder)
        }
    }
}
