//
//  ViewController.swift
//  FastActions-Demo
//
//  Created by dengyonghao on 2019/8/20.
//  Copyright © 2019 DengYonghao. All rights reserved.
//

import UIKit
import FastActions

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pushNextVC(_ sender: FastActionsParams) {
        let vc = NextViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

