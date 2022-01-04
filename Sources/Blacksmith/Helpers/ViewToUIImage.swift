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
        let controller = UIHostingController(rootView: self.frame(width: size.width, height: size.height))
//        controller.view.bounds = CGRect(origin: .zero, size: size)
        let image = controller.view.asImage()
        
        return image
    }
}

extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        return renderer.image { ctx in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
    }
}
#endif
