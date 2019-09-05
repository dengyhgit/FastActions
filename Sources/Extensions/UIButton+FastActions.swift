//
//  UIButton+FastActions.swift
//  FastActions
//
//  Created by dengyonghao on 2019/9/4.
//  Copyright © 2019 DengYonghao. All rights reserved.
//

import Foundation
import UIKit


extension FastActionsWrapper where Base: UIButton {
    
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
        self.base.action(forControlEvents: .touchUpInside) { _ in
            vc.fa.dispatchToMyself(params)
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
        self.base.action(forControlEvents: .touchUpInside) { _ in
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
        self.base.action(forControlEvents: .touchUpInside) { _ in
            vc.fa.dispathcToNavVCs(params)
        }
    }
    
}

private var buttonActionBlockKey: Void?

extension UIButton {
    
    private var actionBlock: ((_ sender: UIButton)-> Void)? {
        get { return getAssociatedObject(self, &buttonActionBlockKey) }
        set { setRetainedAssociatedObject(self, &buttonActionBlockKey, newValue) }
    }
    
    fileprivate func action(forControlEvents controlEvents: UIControl.Event, _ block: ((_ sender: UIButton)-> Void)?) {
        actionBlock = block
        self.addTarget(self, action: #selector(handleAction(_:)), for: controlEvents)
    }
    
    @objc private func handleAction(_ sender: UIButton) {
        actionBlock?(sender)
    }

}
