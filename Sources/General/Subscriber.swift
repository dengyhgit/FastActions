//
//  Subscriber.swift
//  FastActions
//
//  Created by dengyonghao on 2019/9/1.
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

public class Subscription<Base> {
    
}

class SubscriberWrapper: Hashable {
    
    weak var subscriber: AnyObject?
    
    init(subscriber: AnyObject) {
        self.subscriber = subscriber
        self.identifier = ObjectIdentifier(subscriber)
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(self.identifier)
    }
    
    private let identifier: ObjectIdentifier
    
    static func == (lhs: SubscriberWrapper, rhs: SubscriberWrapper) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
}
