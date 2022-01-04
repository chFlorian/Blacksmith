//
//  ExportMarketingImageToURL.swift
//  Blacksmith
//
//  Created by Florian Schweizer on 04.01.22.
//

import XCTest
import SwiftUI

public extension XCTestCase {
    func exportMarketing<V: View>(image: V, toURL url: URL) {
        do {
#if os(macOS)
            guard let nsImage = image.renderAsImage(),
                  let representation = nsImage.tiffRepresentation else { return }
            
            guard let bitmap = NSBitmapImageRep(data: representation) else { return }
            let pngData = bitmap.representation(using: .png, properties: [:])
            
            try pngData?.write(to: url)
            print("Blacksmith: ☑️ Exported marketing image to \(url).")
#else
            
#endif
        } catch {
            print(error)
        }
    }
}

public extension XCUIScreenshot {
    #if os(macOS)
    func quickExportWithTitle(
        _ title: String,
        background: ImageBackground,
        exportSize: ExportSize,
        alignment: TitleAlignment,
        font: Font = .system(size: 50, weight: .regular, design: .rounded)
    ) {
        do {
            let image = ScreenshotWithTitle(
                title: title,
                image: Image(nsImage: self.image),
                background: background,
                exportSize: exportSize,
                alignment: alignment,
                font: font
            )
            
            guard let nsImage = image.renderAsImage(),
                  let representation = nsImage.tiffRepresentation else { return }
            
            guard let bitmap = NSBitmapImageRep(data: representation) else { return }
            let pngData = bitmap.representation(using: .png, properties: [:])
            
            let url = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("\(title.replacingOccurrences(of: ".", with: "")).png")
            
            try pngData?.write(to: url)
            print("Blacksmith: ☑️ Exported marketing image to \(url).")
        } catch {
            print(error)
        }
    }
    #endif
    
#if os(iOS)
    func quickExportWithTitle(
        _ title: String,
        background: ImageBackground,
        exportSize: ExportSize,
        alignment: TitleAlignment,
        font: Font = .system(size: 50, weight: .regular, design: .rounded)
    ) -> XCTAttachment? {
        let image = ScreenshotWithTitle(
            title: title,
            image: Image(uiImage: self.image),
            background: background,
            exportSize: exportSize,
            alignment: alignment,
            font: font
        )
        
        let uiImage = image.snapshot()
        guard let pngData = uiImage.pngData() else { return nil }
        
        return XCTAttachment(data: pngData, uniformTypeIdentifier: "png")
    }
#endif
}
