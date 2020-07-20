//
//  ViewController.swift
//  MyFirst
//
//  Created by がり on 2020/07/20.
//  Copyright © 2020 がり. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // (1) ラベルに文字を入れる
        outputLabel.text = "Hello Swift!"
    }

    @IBOutlet weak var outputLabel: UILabel!
    
}

