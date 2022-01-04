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
    public var font: Font = .system(size: 50, weight: .regular, design: .rounded)
    
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
