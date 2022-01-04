#  Blacksmith

Automated and localized App Store Screenshots without leaving Xcode.

## Installation Instructions
Blacksmith supports installation via Swift Package Manager.
To install, add the package via this url: `https://github.com/orgs/BlacksmithApp/Blacksmith`

## Usage

```swift
import XCTest
import SwiftUI

class ForgeUITests: XCTestCase {
    func testExample() throws {
        let app = XCUIApplication()
        
        // 1. Specify a language that should be used for the export
        app.launchArguments = ["-AppleLanguages", "(en)"]
        app.launch()
        
        // 2. Navigate to the screen that should be exported
        let window = XCUIApplication().windows.firstMatch
        window.outlines.buttons["🛠 Layout Builder"].click()
        
        let addElementButton = window.toolbars.buttons["Add Element"]
        addElementButton.click()
        
        // 3. Create a screenshot
        let screenshot = app.screenshot()
        
        // 4. Setup an ExportSize & a Capturing View
        let exportSize = ExportSize.mac
        let testView = ScreenshotWithTitle(title: "Create your own image layouts.", image: screenshot.image, backgroundColor: .blue, cornerRadius: exportSize.cornerRadius)
        
        // 5. Choose a location for the generated image and export it
        let url = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("result.png")
        exportMarketing(image: testView, toURL: url, withSize: exportSize.size)
    }
}
```
