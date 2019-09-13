![FastAction](https://github.com/dengyhgit/FastActions/blob/master/images/FastActions.png?raw=true)

<p align="center">
<a href="https://travis-ci.org/dengyhgit/FastActions"><img src="https://img.shields.io/travis/dengyhgit/FastActions/master.svg"></a>
<a href="https://github.com/Carthage/Carthage/"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
<a href="https://github.com/dengyhgit/FastActions/"><img src="https://img.shields.io/cocoapods/v/FastActions.svg?style=flat"></a>
<a href="https://github.com/dengyhgit/FastActions"><img src="https://img.shields.io/cocoapods/l/FastActions.svg?style=flat"></a>
<a href="https://github.com/dengyhgit/FastActions/"><img src="https://img.shields.io/cocoapods/p/FastActions.svg?style=flat"></a>
</p>



FastActions 是一个用纯 Swift 来实现的快捷的事件处理库。在 MVC 架构模式开发，事件传递一件麻烦的事情，同层的 View 与 ViewController 通讯，通常使用 Delegate 来传递与处理事件，跨层访问则会用 Notification。这两种方式都比较繁琐，FastActions 的目的是取代 Delegate 与 Notification 来传递与处理事件。

## Features

- [x] View 向所在的 ViewController 或其 ChildViewControllers 、ParentViewController 发送事件
- [x] View 向所在的 NavigationController 的 viewControllers 发送事件，支持透传或单一响应
- [x] View 可以任意对象发送事件，可以取代 Notification
- [x] 支持 Button 快捷发送事件
- [x] View 支持 GestureRecognizer 事件发送
- [x] 支持 Swift 5.0+

最简单的用例是 Button 点击时向所在的 ViewController 发送事件，只需要调用 button 的扩展方法发送事件，在 ViewController 实现 FastActionsMaps 协议的 fastActionsMaps 的方法，则可以获取到事件:

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

使用 FastActions 向全局传递事件，响应者需要选择 subscribe 才能正常响应全局事件传递，在 deinit  时也需要 unsubscribe，FastActions 全局事件传递的内部是基于观察者模式实现的：

```swift
// View.swift
let params = FastActionsParams(tag: "kDispatchAllAction")
params.data = "Hi FastAction"
sender.fa.dispatch(params: params)

// ViewController.swift
class ViewController: UIViewController {
    deinit {
        self.fa.unsubscribe()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fa.subscribe()
    }
}

extension NextViewController: FastActionsMaps {
    func fastActionsMaps() -> Dictionary<String, Selector> {
        return [
                "kDispatchAllAction":#selector(clickBtn(_:)),
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

使用 CocoaPods 将 FastActions 集成到 Xcode 项目中，需要将 `Podfile` 中指定的 target 添加:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target 'MyApp' do
  # other pod
  pod 'FastActions'
end
```

然后执行以下命令：

```
$ pod install
```

### Carthage

使用 Carthage 将 FastActions 集成到 Xcode 项目中，需要在 `Cartfile` 中指定它:

```
github "dengyhgit/FastActions" ~> 1.0
```

然后，运行以下命令构建 FastActions framework:

```
$ carthage update FastActions --platform iOS
# Or `--platform macOS`, `--platform tvOS`
```

## Other

### Future of FastActions

FastActions 其目的主要是为事件传递提供更便捷的方式， 以提高我们的开发效率。FastActions 目前只提供了一些基本功能，它还有很大的改进空间，我们在后面会提供更多功能，让其变得更完善。当然，希望大家可以共同参与进来，共同努力。如果你在使用的时候遇到问题，也可以给我们提 Issues。

### License

FastActions 是基于 MIT 协议下发布的，其详细信息，请参 LICENSE 文件。