//
//  UIView+FastActions.swift
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

extension FastActionsWrapper where Base: View {
    
    //MARK: - Public
    
    public func dispatchToVC(_ tag: String) {
        guard let vc = viewController else { return }
        let params = FastActionsParams(tag: tag)
        params.sender = base
        vc.fa.dispatchToMyself(params)
    }

    public func dispatchToVC(params: FastActionsParams) {
        guard let vc = viewController else { return }
        if params.sender == nil {
            params.sender = base
        }
        vc.fa.dispatchToMyself(params)
    }
    
    public func dispatchToParentVC(_ tag: String) {
        guard let vc = viewController else { return }
        let params = FastActionsParams(tag: tag)
        params.sender = base
        vc.fa.dispatchToParent(params)
    }
    
    public func dispatchToParentVC(params: FastActionsParams) {
        guard let vc = viewController else { return }
        if params.sender == nil {
            params.sender = base
        }
        vc.fa.dispatchToParent(params)
    }
    
    public func dispathcToNavVCs(_ tag: String, _ traverseAll: Bool = false) {
        guard let vc = viewController else { return }
        let params = FastActionsParams(tag: tag)
        params.sender = base
        vc.fa.dispathcToNavVCs(params)
    }
    
    public func dispathcToNavVCs(params: FastActionsParams) {
        guard let vc = viewController else { return }
        if params.sender == nil {
            params.sender = base
        }
        vc.fa.dispathcToNavVCs(params)
    }

    //MARK: - Private
    
    private var viewController: ViewController? {
        var view = self.base as View
        #if os(macOS)
        var responder = view.nextResponder
        #else
        var responder = view.next
        #endif
        while let r = responder {
            if let vc = r as? ViewController {
                return vc
            }
            guard let superview = view.superview else { return nil }
            view = superview
            #if os(macOS)
            responder = view.nextResponder
            #else
            responder = view.next
            #endif
        }
        return nil
    }
    
}
