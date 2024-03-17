#  Blacksmith

Support the project: <a href='https://ko-fi.com/W7W14R38E' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://storage.ko-fi.com/cdn/kofi2.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

Previously distributed through: <a href='https://flowritescode.gumroad.com/l/blacksmith?layout=profile'>Gumroad ($0+)</a>

Automated and localized App Store Screenshots without leaving Xcode.

## Installation Instructions
Blacksmith supports installation via Swift Package Manager.
To install, add the package via this url: 

```
https://github.com/chFlorian/Blacksmith
```

## Usage

Blacksmith is used to automatically generated simple App Store screenshots for multiple localizations.

### 1. Add Blacksmith to your UITest target & import Blacksmith

```swift
import Blacksmith
import XCTest
import SwiftUI

class ForgeUITests: XCTestCase {
```

### 2. Create a testX function for each screen/locale that you want to create an image of

```swift
func testScreenshot_AddElementToLayoutBuilder() throws {
    let app = XCUIApplication()
```

### 3. Specify a language that should be used for the export

```swift
app.launchArguments = ["-AppleLanguages", "(en)"]
app.launch()
```

### 4. Navigate to the screen that should be exported

```swift
let window = app.windows.firstMatch
window.outlines.buttons["🛠 Layout Builder"].click()

let addElementButton = window.toolbars.buttons["Add Element"]
addElementButton.click()
```

### 5. Create a screenshot

```swift
let screenshot = app.screenshot()
```

### 5. (A) Use the quickExportWithTitle function on screenshot

You can either use quickExportWithTitle directly on the XCUIScreenshot or follow step 6 and 7

### 6. Setup a Capturing View

```swift
let exportSize = ExportSize.mac
let capturingView = ScreenshotWithTitle(
    title: "Create your own image layouts.", 
    image: screenshot.image, 
    background: .color(.blue),
    exportSize: .mac
)    
```

### 7. Choose a location to export the image

```swift
let url = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("result.png")
exportMarketing(image: capturingView, toURL: url)
```

### 8. Clean up

```swift
app.terminate()
    }
}
```

### Full Code Example:

```swift
import Blacksmith
import XCTest
import SwiftUI

class ForgeUITests: XCTestCase {
    func testExample() throws {
        let app = XCUIApplication()
        
        app.launchArguments = ["-AppleLanguages", "(en)"]
        app.launch()
        
        let window = XCUIApplication().windows.firstMatch
        window.outlines.buttons["🛠 Layout Builder"].click()
        
        let addElementButton = window.toolbars.buttons["Add Element"]
        addElementButton.click()
        
        let screenshot = app.screenshot()
        
        let exportSize = ExportSize.mac
        let capturingView = ScreenshotWithTitle(
            title: "Create your own image layouts.", 
            image: screenshot.image, 
            background: .color(.blue),
            exportSize: .mac
        ) 
        
        let url = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("result.png")
        exportMarketing(image: capturingView, toURL: url)
        
        app.terminate()
    }
}
```
