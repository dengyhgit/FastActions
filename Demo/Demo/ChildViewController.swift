//
//  ChildViewController.swift
//  FastActions-Demo
//
//  Created by dengyonghao on 2019/9/2.
//  Copyright © 2019 DengYonghao. All rights reserved.
//

import UIKit
import FastActions

class ChildViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
    }

    @IBAction func click(_ sender: UIButton) {
        let params = FastActionsParams(tag: "kChildVCBntClickAction")
        params.sender = sender
        params.data = 100
        sender.fa.dispatchToVC(params: params)
    }
    
}
