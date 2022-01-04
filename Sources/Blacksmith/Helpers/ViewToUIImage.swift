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
    func takeScreenshot(origin: CGPoint, size: CGSize) -> UIImage {
        let window = UIWindow(frame: CGRect(origin: origin, size: size))
        
        let hosting = UIHostingController(rootView: self)
        
        hosting.view.frame = window.frame
        
        window.addSubview(hosting.view)
        window.makeKeyAndVisible()
        
        return hosting.view.renderedImage
    }
}

extension UIView {
    var renderedImage: UIImage {
        let rect = self.bounds
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        self.layer.render(in: context)
        
        let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        return capturedImage
    }
}
#endif
