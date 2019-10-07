//
//  ViewController.swift
//  SupersizeMe
//
//  Created by Lunga MAKWAKWA on 2019/10/07.
//  Copyright © 2019 Lunga MAKWAKWA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theL: UILabel!
    @IBAction func helloW(_ sender: Any) {
        print("Hello World !")
        theL.text = "Hello World !"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

