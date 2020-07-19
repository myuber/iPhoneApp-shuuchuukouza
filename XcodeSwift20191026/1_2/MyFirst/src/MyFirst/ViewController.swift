//
//  ViewController.swift
//  MyFirst
//
//  Created by Swift-Beginners on 2019/10/07.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //（１）ラベルに文字を入れる
        outputLabel.text =
"Hello Swift!"
    }

    @IBOutlet weak var outputLabel: UILabel!
    
}

