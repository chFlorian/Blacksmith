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

extension View {
    func renderAsImage() -> NSImage? {
        let view = NoInsetHostingView(rootView: self)
        view.setFrameSize(view.fittingSize)
        
        return view.bitmapImage()
    }
}

class NoInsetHostingView<V>: NSHostingView<V> where V: View {
    override var safeAreaInsets: NSEdgeInsets {
        return .init()
    }
}

func exportMarketing<V: View>(image: V, toURL url: URL, withSize size: CGSize) {
    do {
        let exportView = image.frame(width: size.width, height: size.height)
        
        guard let nsImage = exportView.renderAsImage(),
              let representation = nsImage.tiffRepresentation else { return }
        
        guard let bitmap = NSBitmapImageRep(data: representation) else { return }
        let pngData = bitmap.representation(using: .png, properties: [:])
        
        try pngData?.write(to: url)
    } catch {
        print(error)
    }
}
