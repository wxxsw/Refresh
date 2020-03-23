# Refresh

<p align="left">
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/language-Swift%205-f48041.svg?style=flat"></a>
<a href="https://developer.apple.com/swiftui"><img src="https://img.shields.io/badge/framework-SwiftUI-blue.svg?style=flat"></a>
<a href="https://developer.apple.com/ios"><img src="https://img.shields.io/badge/platform-iOS%2013%2b-blue.svg?style=flat"></a>
<a href="https://github.com/apple/swift-package-manager"><img src="https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat"></a>
<a href="https://codebeat.co/projects/github-com-wxxsw-refresh-master"><img alt="codebeat badge" src="https://codebeat.co/badges/a130bdd3-eb27-4bf1-820f-8839bbbb3715" /></a>
<a href="https://github.com/wxxsw/Refresh/blob/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat"></a>
</p>

## Quick Start

```swift
List {
    RefreshHeader(refreshing: $headerRefreshing, action: {
        self.reload()
    }) { progress in
        if self.headerRefreshing {
            Text("refreshing...")
        } else {
            Text("Pull to refresh")
        }
    }

    ForEach(items) { item in
        YourCell(item: item)
    }

    RefreshFooter(refreshing: $footerRefreshing, action: {
        self.loadMore()
    }) {
        if self.noMore {
            Text("No more data !")
        } else {
            Text("refreshing...")
        }
    }
    .noMore(noMore)
    .preload(offset: 50)
}
.enableRefresh()
```

## Demo

Open `Refresh.xcodeproj` and run `Demo` target.

## Installation

### Swift Package Manager

1. Select `Xcode -> File -> Swift Packages -> Add Package Dependency...` 
2. Enter `https://github.com/wxxsw/Refresh`.
3. Click `Next`, then select the version, complete.

### Requirements

- iOS 13+
- Xcode 11+
- Swift 5+

## License

Refresh is released under the MIT license. [See LICENSE](https://github.com/wxxsw/Refresh/blob/master/LICENSE) for details.
