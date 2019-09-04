//
//  NextViewController.swift
//  FastActions-Demo
//
//  Created by dengyonghao on 2019/9/2.
//  Copyright © 2019 DengYonghao. All rights reserved.
//

import UIKit
import FastActions

class NextViewController: UIViewController {
    
    deinit {
        self.fa.unsubscribe()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FastActions"
        view.backgroundColor = UIColor.white
        self.fa.subscribe()
        
        let childVC = ChildViewController()
        self.addChild(childVC)
        childVC.didMove(toParent: self)
        self.view.addSubview(childVC.view)
    }

    @IBAction func dispatchAll(_ sender: UIButton) {
        let params = FastActionsParams(tag: "kDispatchAllAction")
        params.data = "Hi FastAction"
        sender.fa.dispatch(params: params)
    }
    
    @IBAction func dispatchVC(_ sender: UIButton) {
        let params = FastActionsParams(tag: "kDispatchVCAction")
        params.data = "Hi FastAction DispatchVC"
        sender.fa.dispatchToVC(params: params)
    }
    
}

extension NextViewController: FastActionsMaps {
    func fastActionsMaps() -> Dictionary<String, Selector> {
        return [
                "kDispatchAllAction":#selector(clickBtn(_:)),
                "kChildVCBntClickAction":#selector(childVCBntClick(_:)),
                "kDispatchVCAction":#selector(currentVCBntClick(_:)),
                ]
    }
    
    @objc func clickBtn(_ params: FastActionsParams) {
        print(params.data ?? "data is nil")
    }
    
    @objc func childVCBntClick(_ params: FastActionsParams) {
        print(params.data ?? "data is nil")
    }
    
    @objc func currentVCBntClick(_ params: FastActionsParams) {
        print(params.data ?? "data is nil")
    }


}

