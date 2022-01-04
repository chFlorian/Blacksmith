//
//  ScreenshotWithTitle.swift
//  Blacksmith
//
//  Created by Florian Schweizer on 03.01.22.
//

import SwiftUI

public struct ScreenshotWithTitle: View {
    public let title: String
    public let image: NSImage
    public let backgroundColor: Color
    public let cornerRadius: Double
    public let font: Font
    
    public init(
        title: String,
        image: NSImage,
        backgroundColor: Color,
        cornerRadius: Double,
        font: Font = .system(size: 50, weight: .regular, design: .rounded)
    ) {
        self.title = title
        self.image = image
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.font = font
    }
    
    public var body: some View {
        VStack {
            Text(title)
                .font(font)
                .padding(.top)
            
            Spacer()
            
            Image(nsImage: image)
                .resizable()
                .cornerRadius(cornerRadius)
                .scaledToFit()
                .padding()
        }
        .padding()
        .background(backgroundColor)
    }
}
