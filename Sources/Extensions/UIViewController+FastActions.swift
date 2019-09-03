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

    public func dispatchToMyself(_ params: FastActionsParams) {
        executeAction(self.base, params: params)
    }
    
    public func dispatchToParent(_ params: FastActionsParams) {
        
        guard let parent = self.base.parent else { return }
        executeAction(parent, params: params)
    }

    public func dispatchToChile(_ params: FastActionsParams) {
        let vcs = self.base.children
        for vc in vcs {
            executeAction(vc, params: params)
        }
    }
    
    public func dispathcToNavVCs(_ params: FastActionsParams, _ traverseAll: Bool = false) {
        
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
