//
//  ScreenshotWithTitle.swift
//  Blacksmith
//
//  Created by Florian Schweizer on 03.01.22.
//

import SwiftUI

struct ScreenshotWithTitle: View {
    let title: String
    let image: NSImage
    let backgroundColor: Color
    let cornerRadius: Double
    var font: Font = .system(size: 50, weight: .regular, design: .rounded)
    
    var body: some View {
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
