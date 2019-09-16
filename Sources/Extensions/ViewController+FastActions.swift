//
//  UIViewController+FastActions.swift
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

extension FastActionsWrapper where Base: ViewController {
    
    /// action dispatch to self
    ///
    /// - Parameter params: action params
    public func dispatchToSelf(_ params: FastActionsParams) {
        if params.sender == nil {
            params.sender = base
        }
        executeAction(self.base, params: params)
    }
    
    /// action dispatch to parent viewcontroller
    ///
    /// - Parameter params: action params
    public func dispatchToParent(_ params: FastActionsParams) {
        if params.sender == nil {
            params.sender = base
        }
        guard let parent = self.base.parent else { return }
        executeAction(parent, params: params)
    }

    /// action dispatch to child viewcontroller
    ///
    /// - Parameter params: action params
    public func dispatchToChile(_ params: FastActionsParams) {
        if params.sender == nil {
            params.sender = base
        }
        let vcs = self.base.children
        for vc in vcs {
            executeAction(vc, params: params)
        }
    }
    
    
    /// action dispatch to navigationController viewcontrollers
    ///
    /// - Parameters:
    ///   - params: action params
    ///   - traverseAll: traverse all viewcontrollers, default is false
    public func dispathcToNavVCs(_ params: FastActionsParams, _ traverseAll: Bool = false) {
        if params.sender == nil {
            params.sender = base
        }
        #if os(macOS)
            
        #else
        guard let vcs = self.base.navigationController?.viewControllers else { return }
        for vc in vcs {
            guard let targer = vc as? FastActionsMaps else { continue }
            guard let selector = targer.fastActionsMaps()[params.tag] else { continue }
            guard let obj = targer as? NSObject else { continue }
            obj.perform(selector, with: params)
            if (!traverseAll) {
                break
            }
        }
        #endif
    }
    
    // MARK: - Private
    
    private func executeAction(_ vc: ViewController, params: FastActionsParams) {
        guard let targer = vc as? FastActionsMaps else { return }
        guard let selector = targer.fastActionsMaps()[params.tag] else { return }
        guard let obj = targer as? NSObject else { return }
        obj.perform(selector, with: params)
    }

}
