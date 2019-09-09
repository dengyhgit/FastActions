![FastAction](./images/FastActions.png)

<p align="center">
<a href="https://travis-ci.org/dengyhgit/FastActions"><img src="https://img.shields.io/travis/dengyhgit/FastActions/master.svg"></a>
<a href="https://github.com/Carthage/Carthage/"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
<a href="https://github.com/dengyhgit/FastActions/"><img src="https://img.shields.io/cocoapods/v/FastActions.svg?style=flat"></a>
<a href="https://github.com/dengyhgit/FastActions"><img src="https://img.shields.io/cocoapods/l/FastActions.svg?style=flat"></a>
<a href="https://github.com/dengyhgit/FastActions/"><img src="https://img.shields.io/cocoapods/p/FastActions.svg?style=flat"></a>
</p>



FastActions is a powerful and pure Swift implemented library for action handler.

## Features

- [x] View send action to current ViewController or ChildViewController
- [x] View send action to current NavigationController viewControllers
- [x] View send action to any Class

The simplest use-case is send action to an `ViewController` with the `UIButton` extension:

```swift
let button = UIButton()
let params = FastActionsParams(tag: "kBntClickAction")
button.fa.dispatchToVC(params: params)
```

## Requirements

- iOS 9.0+ / macOS 10.12+ / tvOS 10.0+
- Swift 4.0+

# Installation

### CocoaPods

To integrate FastActions into your Xcode project using CocoaPods, specify it to a target in your `Podfile`:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target 'MyApp' do
  # other pod
  pod 'FastActions'
end
```

Then, run the following command:

```
$ pod install
```

### Carthage

To integrate FastActions into your Xcode project using Carthage, specify it in your `Cartfile`:

```
github "dengyhgit/FastActions" ~> 1.0
```

Then, run the following command to build the FastActions framework:

```
$ carthage update FastActions --platform iOS
# Or `--platform macOS`, `--platform tvOS`
```

## License

FastActions is released under the MIT license. See LICENSE for details.

