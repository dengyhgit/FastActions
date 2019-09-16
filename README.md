![FastAction](https://github.com/dengyhgit/FastActions/blob/master/images/FastActions.png?raw=true)

<p align="center">
<a href="https://travis-ci.org/dengyhgit/FastActions"><img src="https://img.shields.io/travis/dengyhgit/FastActions/master.svg"></a>
<a href="https://github.com/Carthage/Carthage/"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
<a href="https://github.com/dengyhgit/FastActions/"><img src="https://img.shields.io/cocoapods/v/FastActions.svg?style=flat"></a>
<a href="https://github.com/dengyhgit/FastActions"><img src="https://img.shields.io/cocoapods/l/FastActions.svg?style=flat"></a>
<a href="https://github.com/dengyhgit/FastActions/"><img src="https://img.shields.io/cocoapods/p/FastActions.svg?style=flat"></a>
</p>


[中文文档](https://github.com/dengyhgit/FastActions/blob/master/README-CN.md)

FastActions is a powerful and pure Swift implemented library for action handler.

## Features

- [x] View send action to current ViewController( or childViewController or parentViewController)
- [x] View send action to current NavigationController viewControllers
- [x] View send action to any Class
- [x] Support Button Click Action
- [x] View support GestureRecognizer Action
- [x] Support Swift 5.0+

The simplest use-case is send action to an `ViewController` with the `UIButton` extension:

```swift
// View.swift
let params = FastActionsParams(tag: "kBntClickAction")
params.data = "Hi FastActions"
self.button.fa.addDispatchToVC(params: params, forControlEvents: .touchUpInside)
// or
// self.button.fa.addDispatchToVC("kBntClickAction", forControlEvents: .touchUpInside)

// ViewController.swift
extension ViewController: FastActionsMaps {
    func fastActionsMaps() -> Dictionary<String, Selector> {
        return [
                "kBntClickAction":#selector(clickBtn(_:)),
                ]
    }
    
    @objc func clickBtn(_ params: FastActionsParams) {
        print(params.data ?? "data is nil")
    }
}
```

## Requirements

- iOS 9.0+ / macOS 10.12+ / tvOS 10.0+
- Swift 4.2+

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

## Other

### Future of FastActions

The purpose of FastActions is to provide a more convenient way for handle action. FastActions currently only provides some basic functionality, and it has a lot of room for improvement. We will provide more features later to make it more complete. Of course, I hope that everyone can join in and work together. 

### License

FastActions is released under the MIT license. See LICENSE for details.

