//
//  ViewController.swift
//  BrewTime
//
//  Created by Jan Staudenmaier on 05.04.20.
//  Copyright © 2020 Staudenmaier & Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var startTimerButtron: UIButton!
    @IBOutlet var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timeLabel.isHidden = true
    }

    @IBAction func startPressed(_ sender: Any) {
        print("Start timer button was pressed")
        timeLabel.isHidden = false
    }
    
}

