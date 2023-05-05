// Created by Florian Schweizer on 10.03.23

import SwiftUI

// https://appradar.com/de/blog/ios-app-screenshot-sizes-and-guidelines-for-the-apple-app-store

struct StyledText {
    let text: String
    let font: Font
}

struct AmazonTemplate0: View, CapturingView {
    let exportSize: ExportSize
    
    let title1: StyledText
    let title2: StyledText
    let title3: StyledText
    let image: Image
    let templateBackground: ImageBackground
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title 1 Large
            Text(title1.text)
                .font(title1.font)
            
            // Title 2 Small
            Text(title2.text)
                .font(title2.font)
            
            // Title 3 Large
            Text(title3.text)
                .font(title3.font)
            
            // Image
            image
                .resizable()
                .scaledToFit()
                .frame(height: exportSize.size.height / 2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background (
            ZStack {
                switch templateBackground {
                    case .color(let color):
                        color
                    case .gradient(let linearGradient):
                        linearGradient
                    case .image(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: exportSize.size.width, height: exportSize.size.height)
                            .clipped()
                }
            }
        )
    }
}

struct AmazonTemplate0_Previews: PreviewProvider {
    static var previews: some View {
        let exportSize = ExportSize.iPhone_6_5_Inches
        
        AmazonTemplate0(
            exportSize: exportSize,
            title1: StyledText(
                text: "App only benefits",
                font: .system(size: exportSize.size.height / 15, weight: .semibold, design: .rounded)
            ),
            title2: StyledText(
                text: "make shopping",
                font: .system(size: exportSize.size.height / 15, weight: .thin, design: .rounded)
            ),
            title3: StyledText(
                text: "faster and easier",
                font: .system(size: exportSize.size.height / 15, weight: .semibold, design: .rounded)
            ),
            image: Image(systemName: "person.circle.fill"),
            templateBackground: .color(.blue)
        )
    }
}
