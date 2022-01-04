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
    public let background: ImageBackground
    public let cornerRadius: Double
    public let alignment: TitleAlignment
    public let font: Font
    
    public init(
        title: String,
        image: NSImage,
        background: ImageBackground,
        cornerRadius: Double,
        alignment: TitleAlignment = .titleAbove,
        font: Font = .system(size: 50, weight: .regular, design: .rounded)
    ) {
        self.title = title
        self.image = image
        self.background = background
        self.cornerRadius = cornerRadius
        self.alignment = alignment
        self.font = font
    }
    
    public var body: some View {
        ZStack {
            switch background {
                case .color(let color):
                    color
                case .gradient(let linearGradient):
                    linearGradient
                case .image(let image):
                    image
                        .resizable()
                        .scaledToFill()
            }
            
            VStack {
                if case .titleAbove = alignment {
                    Text(title)
                        .font(font)
                        .padding(.top)
                    
                    Spacer()
                }
                
                Image(nsImage: image)
                    .resizable()
                    .cornerRadius(cornerRadius)
                    .scaledToFit()
                    .padding()
                
                if case .titleBelow = alignment {
                    Spacer()
                    
                    Text(title)
                        .font(font)
                        .padding(.bottom)
                }
            }
            .padding()
        }
    }
}
