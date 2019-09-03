//
//  FastActionsParam.swift
//  FastActions
//
//  Created by dengyonghao on 2019/8/30.
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

public protocol FastActionsParamsProtcol {
    var tag: String { get set }
    var sender: AnyObject? { get set}
    var data: Any? { get set }
    var extraData: Any? { get set }
}

public class FastActionsParams: NSObject, FastActionsParamsProtcol {
    
    public var tag: String
    public weak var sender: AnyObject?
    public var data: Any?
    public var extraData: Any?
    
    public init(tag: String) {
        self.tag = tag
    }
    
    public init(tag: String, sender: AnyObject?, data: Any?, extraData: Any?) {
        self.tag = tag
        self.sender = sender
        self.data = data
        self.extraData = extraData
    }
}
