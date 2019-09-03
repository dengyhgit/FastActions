<p align="center">
<img src="" alt="FastAction" title="FastAction" width="1100"/>
</p>

<p align="center">
<a href="https://github.com/Carthage/Carthage/"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
<a href="https://github.com/dengyhgit/FastActions/"><img src="https://img.shields.io/cocoapods/v/FastActions.svg?style=flat"></a>
</p>


FastActions is a powerful and pure Swift implemented library for action handler.

## Features

- [x] action event

The simplest use-case is send action to an `ViewController` with the `UIButton` extension:

```swift
let button = UIButton()
let params = FastActionsParams(tag: "kBntClickAction")
button.fa.dispatchToVC(params: params)
```

## Requirements

- iOS 9.0+ / macOS 10.12+ / tvOS 10.0+ / watchOS 3.0+
- Swift 4.0+

## License

FastActions is released under the MIT license. See LICENSE for details.