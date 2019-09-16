//
//  UIControl+FastActions.swift
//  FastActions
//
//  Created by dengyonghao on 2019/9/4.
//  Copyright © 2019 DengYonghao. All rights reserved.
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

import UIKit


extension FastActionsWrapper where Base: UIControl {
    
    //MARK: - Public
    
    public func addDispatchToVC(_ tag: String, forControlEvents controlEvents: UIControl.Event) {
        let params = FastActionsParams(tag: tag)
        self.addDispatchToVC(params: params, forControlEvents: controlEvents)
    }
    
    public func addDispatchToVC(params: FastActionsParams, forControlEvents controlEvents: UIControl.Event) {
        guard let vc = viewController else { return }
        if params.sender == nil {
            params.sender = base
        }
        self.base.action(forControlEvents: controlEvents) { _ in
            vc.fa.dispatchToSelf(params)
        }
    }
    
    public func addDispatchToParentVC(_ tag: String, forControlEvents controlEvents: UIControl.Event) {
        let params = FastActionsParams(tag: tag)
        addDispatchToParentVC(params: params, forControlEvents: controlEvents)
    }
    
    public func addDispatchToParentVC(params: FastActionsParams, forControlEvents controlEvents: UIControl.Event) {
        guard let vc = viewController else { return }
        if params.sender == nil {
            params.sender = base
        }
        self.base.action(forControlEvents: controlEvents) { _ in
            vc.fa.dispatchToParent(params)
        }
    }
    
    public func addDispathcToNavVCs(_ tag: String, forControlEvents controlEvents: UIControl.Event, _ traverseAll: Bool = false) {
        let params = FastActionsParams(tag: tag)
        addDispathcToNavVCs(params: params, forControlEvents: controlEvents)
    }
    
    public func addDispathcToNavVCs(params: FastActionsParams, forControlEvents controlEvents: UIControl.Event) {
        guard let vc = viewController else { return }
        if params.sender == nil {
            params.sender = base
        }
        self.base.action(forControlEvents: controlEvents) { _ in
            vc.fa.dispathcToNavVCs(params)
        }
    }
    
}


extension UIControl {
    
    fileprivate func action(forControlEvents controlEvents: UIControl.Event, _ block: ((_ sender: UIButton)-> Void)?) {
        self.actionBlock = block
        self.addTarget(self, action: #selector(handleAction(_:)), for: controlEvents)
    }

}
