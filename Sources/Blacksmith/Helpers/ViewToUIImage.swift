//
//  ViewToUIImage.swift
//  Blacksmith
//
//  Created by Florian Schweizer on 04.01.22.
//

import SwiftUI
#if canImport(UIKit)
import UIKit

extension View {
    func snapshot(withSize size: CGSize) -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: size)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
#endif
