//
//  UIGestureRecognizer+FastActions.swift
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


extension UIView {
    
    fileprivate func tapAction(_ block: ((_ gestureRecognizer: UIGestureRecognizer)-> Void)?) {
        self.tapActionBlock = block
        let tap = UITapGestureRecognizer(target:self, action:#selector(handleAction(_:)))
        self.addGestureRecognizer(tap)
    }
    
    fileprivate func tapAction(numberOfTapsRequired: Int, block: ((_ gestureRecognizer: UIGestureRecognizer)-> Void)?) {
        self.tapActionBlock = block
        let tap = UITapGestureRecognizer(target:self, action:#selector(handleAction(_:)))
        tap.numberOfTapsRequired = numberOfTapsRequired
        self.addGestureRecognizer(tap)
    }
    
}

extension FastActionsWrapper where Base: UIView {
    
    public func tapDispatchToVC(tag: String) {
        let params = FastActionsParams(tag: tag)
        tapDispatchToVC(params: params)
    }
    
    public func tapDispatchToVC(params: FastActionsParams) {
        guard let vc = viewController else { return }
        if params.sender == nil {
            params.sender = base
        }

        self.base.tapAction { (_) in
            vc.fa.dispatchToSelf(params)
        }
    }
    
}
