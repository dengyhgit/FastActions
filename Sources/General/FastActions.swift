//
//  FastActions.swift
//  FastActions
//
//  Created by dengyonghao on 2019/8/20.
//  Copyright © 2019 DengYonghao. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import Foundation

#if os(macOS)
import AppKit
public typealias ViewController = NSViewController
public typealias View = NSView
#else
import UIKit
#if !os(watchOS)
public typealias ViewController = UIViewController
public typealias View = UIView
#else
import WatchKit
public typealias View = WKInterfaceObject
public typealias ViewController = WKInterfaceController
#endif
#endif

/// Wrapper for FastActions compatible types. This type provides an extension point for
/// connivence methods in FastActions.
public struct FastActionsWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

/// Represents an object type that is compatible with FastActions. You can use `fa` property to get a
/// value in the namespace of FastActions.
public protocol FastActionsCompatible: AnyObject { }

/// Represents a value type that is compatible with FastActions. You can use `fa` property to get a
/// value in the namespace of FastActions.
public protocol FastActionsCompatibleValue { }


extension FastActionsCompatible {
    /// Gets a namespace holder for FastActions compatible types.
    public var fa: FastActionsWrapper<Self> {
        get { return FastActionsWrapper(self) }
        set { }
    }
}

extension FastActionsCompatibleValue {
    /// Gets a namespace holder for FastActions compatible types.
    public var fa: FastActionsWrapper<Self> {
        get { return FastActionsWrapper(self) }
        set { }
    }
}

extension View: FastActionsCompatible { }
extension ViewController: FastActionsCompatible { }
