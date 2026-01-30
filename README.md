# SparkleTest

A macOS application demonstrating Sparkle framework integration for automatic software updates, built with SwiftUI and SwiftData using MVVM architecture.

## Overview

SparkleTest is a reference project showcasing how to implement automatic update checking and distribution using the [Sparkle framework](https://sparkle-project.org/). The app automatically checks for updates on launch and periodically, providing a seamless update experience for macOS applications.

## What is Sparkle?

[Sparkle](https://sparkle-project.org/) is an open-source software update framework for macOS applications. It provides a simple and secure way for macOS apps to automatically check for, download, and install updates without requiring users to manually download new versions from a website or the Mac App Store. Users are alerted with embedded update notifications, as well as a manual check for updates button.

### Key Features of Sparkle:

- **Automatic Updates**: Apps can automatically check for updates in the background
- **User-Friendly**: Provides a native macOS update experience with progress indicators and release notes
- **Secure**: Uses cryptographic signatures (EdDSA) to verify update authenticity and prevent tampering
- **Flexible**: Supports delta updates (smaller downloads), release notes, phased rollouts, and update channels
- **No App Store Required**: Works for apps distributed outside the Mac App Store
- **Open Source**: Free and open-source under the MIT license

### Why Use Sparkle?

For macOS developers distributing apps outside the Mac App Store, Sparkle is the industry-standard solution for handling updates. It's used by thousands of macOS applications and provides:

- **Better User Experience**: Users get updates automatically without manual downloads
- **Security**: Cryptographic signing ensures updates are authentic and haven't been tampered with
- **Reliability**: Battle-tested framework used by major macOS applications
- **Easy Integration**: Simple API that integrates seamlessly with Swift and Objective-C apps

Sparkle handles all the complexity of update distribution, including checking for updates, downloading files, verifying signatures, and installing updates safely.

## Features

- ✅ **Automatic Update Checking**: Checks for updates on app launch and periodically
- ✅ **Sparkle Integration**: Full integration with Sparkle 2.8.1 framework
- ✅ **MVVM Architecture**: Clean separation of concerns with Models, Views, ViewModels, and Services
- ✅ **SwiftUI & SwiftData**: Modern SwiftUI interface with SwiftData persistence
- ✅ **EdDSA Signing**: Secure update distribution with EdDSA signatures
- ✅ **App Sandbox**: Configured with proper entitlements for macOS security

## Requirements

- **macOS**: 26.2 or later
- **Xcode**: Latest version
- **Swift**: 5.0+
- **Sparkle**: 2.8.1 (via Swift Package Manager)

## Project Structure

```
SparkleTest/
├── Models/              # Data models (SwiftData)
│   └── Item.swift
│
├── Views/               # SwiftUI views
│   ├── ContentView.swift
│   └── CheckForUpdatesView.swift
│
├── ViewModels/         # View models (MVVM)
│   ├── ContentViewModel.swift
│   └── CheckForUpdatesViewModel.swift
│
├── Services/           # Services and utilities
│   ├── UpdateChecker.swift
│   └── UpdaterDelegate.swift
│
└── SparkleTestApp.swift # App entry point
```

For more details, see [MVVM_STRUCTURE.md](./MVVM_STRUCTURE.md).

## Installation

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd SparkleTest
   ```

2. Open the project in Xcode:

   ```bash
   open SparkleTest.xcodeproj
   ```

3. Build and run the project (⌘R)

## Configuration

### Update Feed

The app is configured to check for updates from:
```
https://gold240sx.github.io/sparkle_test/appcast.xml
```

To change the update feed URL, edit `SparkleTest/Info.plist`:
```xml
<key>SUFeedURL</key>
<string>YOUR_UPDATE_FEED_URL</string>
```

### Update Checking Behavior

Update checking behavior can be customized in `SparkleTestApp.swift`:

```swift
let updateConfig = UpdateChecker.Configuration(
    checkOnLaunch: true,           // Check on launch
    launchCheckDelay: 1.0,         // Wait 1 second after launch
    checkPeriodically: true,       // Check automatically every hour
    updateCheckInterval: 3600,     // 1 hour = 3600 seconds
    checkOnBecomeActive: false     // Don't check when app becomes active
)
```

## Generating Update Appcasts

To generate appcast files for new versions:

1. Create a directory with your app archives:

   ```bash
   mkdir ~/Desktop/SparkleTest_v1.3
   ```

2. Create a zip file from your app bundle:

   ```bash
   cd ~/Desktop/SparkleTest_v1.3
   zip -r "SparkleTest 1.3.zip" SparkleTest.app
   ```

3. Generate the appcast:

   ```bash
   generate_appcast ~/Desktop/SparkleTest_v1.3
   ```

4. Upload the generated `appcast.xml` and zip files to your server

For detailed instructions, see [GENERATE_APPCAST_GUIDE.md](./GENERATE_APPCAST_GUIDE.md).

## Building for Distribution

1. Archive your app in Xcode (Product → Archive)
2. Export the archive
3. Create a zip file from the exported `.app` bundle
4. Generate the appcast using `generate_appcast`
5. Upload files to your server

## App Information

- **Bundle Identifier**: `com.michaelMartell.SparkleTest`
- **Version**: 1.2
- **Build Number**: 1.2
- **Minimum macOS Version**: 26.2

## Dependencies

- **Sparkle**: 2.8.1 ([GitHub](https://github.com/sparkle-project/Sparkle))
  - Automatically managed via Swift Package Manager

## Security

The app uses:
- **App Sandbox**: Enabled with appropriate entitlements
- **Hardened Runtime**: Enabled
- **EdDSA Signing**: Updates are signed with EdDSA keys
- **Code Signing**: Automatic code signing configured

See `SparkleTest.entitlements` for security configuration details.

## Documentation

- [Update Checking Guide](./SparkleTest/Notes/UPDATE_CHECKING_GUIDE.md) - How automatic updates work

For more information on:
- **MVVM Architecture**: See the project structure section above
- **Generating Appcasts**: See the "Generating Update Appcasts" section above

## Development

### Running Tests

```bash
# Run unit tests
⌘U in Xcode

# Or via command line
xcodebuild test -scheme SparkleTest
```

### Code Style

The project follows Swift standard conventions and uses:
- SwiftUI for UI
- SwiftData for persistence
- MVVM architecture pattern
- ObservableObject for state management

## License

[Add your license here]

## Author

Michael Martell

## Acknowledgments

- [Sparkle Project](https://sparkle-project.org/) for the excellent update framework
- Built with SwiftUI and SwiftData

## Resources

- [Sparkle Documentation](https://sparkle-project.org/documentation/)
- [Sparkle GitHub Repository](https://github.com/sparkle-project/Sparkle)
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui/)
- [SwiftData Documentation](https://developer.apple.com/documentation/swiftdata/)
