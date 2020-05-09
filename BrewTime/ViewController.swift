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
    
    var timer = Timer()
    var timeLeft = 10
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeLeft -= 1
        timeLabel.text = "\(timeLeft)"
        if timeLeft <= 0 {
            timer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timeLabel.isHidden = true
    }

    @IBAction func startPressed(_ sender: Any) {
        print("Start timer button was pressed")
        timeLabel.text = "\(timeLeft)"
        timeLabel.isHidden = false
        startTimerButtron.isHidden = true
        runTimer()
    }
    
}

