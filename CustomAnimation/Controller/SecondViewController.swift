//
//  SecondViewController.swift
//  CustomAnimation
//
//  Created by Anak Mirasing on 3/18/2558 BE.
//  Copyright (c) 2558 iGROOMGRiM. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second VC"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnTapped(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
