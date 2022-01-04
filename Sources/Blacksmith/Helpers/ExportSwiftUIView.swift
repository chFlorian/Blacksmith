//
//  ExportSwiftUIView.swift
//  Blacksmith
//
//  Created by Florian Schweizer on 03.01.22.
//

import SwiftUI

public extension NSView {
    func bitmapImage() -> NSImage? {
        guard let rep = bitmapImageRepForCachingDisplay(in: bounds) else {
            return nil
        }
        
        cacheDisplay(in: bounds, to: rep)
        
        guard let cgImage = rep.cgImage else {
            return nil
        }
        
        return NSImage(cgImage: cgImage, size: bounds.size)
    }
}

public extension View {
    func renderAsImage() -> NSImage? {
        let view = NoInsetHostingView(rootView: self)
        view.setFrameSize(view.fittingSize)
        
        return view.bitmapImage()
    }
}

public class NoInsetHostingView<V>: NSHostingView<V> where V: View {
    override public var safeAreaInsets: NSEdgeInsets {
        return .init()
    }
}

public func exportMarketing<V: View>(image: V, toURL url: URL) {
    do {
        guard let nsImage = image.renderAsImage(),
              let representation = nsImage.tiffRepresentation else { return }
        
        guard let bitmap = NSBitmapImageRep(data: representation) else { return }
        let pngData = bitmap.representation(using: .png, properties: [:])
        
        try pngData?.write(to: url)
    } catch {
        print(error)
    }
}
