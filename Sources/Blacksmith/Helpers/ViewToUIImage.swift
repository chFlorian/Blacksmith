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

  // Requires the origin and size of the view. These can be gotten
  // from the view using a GeometryReader.
  func takeScreenshot(origin: CGPoint, size: CGSize) -> UIImage {

    // Create a UIKit window which has the same dimensions and size as the SwiftUI view.
    let window = UIWindow(frame: CGRect(origin: origin, size: size))

    // Wrap the SwiftUI view into a UIKit view hierarchy.
    let hosting = UIHostingController(rootView: self)

    // Make the hosting view's size match the window's size.
    hosting.view.frame = window.frame

    // Add the hosting view to the window.
    window.addSubview(hosting.view)
    window.makeKeyAndVisible()

    // Create an image from it (see UIView extension below).
    return hosting.view.renderedImage
  }
}

extension UIView {
  var renderedImage: UIImage {

    // The size of the image we want to create, based on the size of the
    // current view.
    let rect = self.bounds

    // Start an image context, using the rect from above to set the size.
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
    let context: CGContext = UIGraphicsGetCurrentContext()!

    // Render the current view into the image context.
    self.layer.render(in: context)

    // Extract an image from the context.
    let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!

    UIGraphicsEndImageContext()
    return capturedImage
  }
}

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
