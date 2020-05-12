//
//  ViewController.swift
//  BrewTime
//
//  Created by Jan Staudenmaier on 05.04.20.
//  Copyright © 2020 Staudenmaier & Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var startRecipeButton: UIButton!
    @IBOutlet var resetRecipeButton: UIButton!
    
    @IBOutlet var timeTotalLabel: UILabel!
    @IBOutlet var timeStepLabel: UILabel!
    @IBOutlet var descStepCurrentLabel: UILabel!
    @IBOutlet var descStepNextLabel: UILabel!
    @IBOutlet var descStepNextHeading: UILabel!

    
    var timer = Timer()
    var timeTotalLeft = 0
    var timeStepLeft = 0
    var currentStep = 0
    
    var recipeStepsAeropress: [String] = ["Pour", "Stir", "Steep", "Stir", "Flip", "Plunge"]
    var recipeTimesAeropress: [Int] = [5, 10, 45, 5, 5, 20]

    func setStartScreen() {
        startRecipeButton.isHidden = false
        timeTotalLabel.isHidden = true
        timeStepLabel.isHidden = true
        descStepCurrentLabel.isHidden = true
        descStepNextLabel.isHidden = true
        descStepNextHeading.isHidden = true
    }
    
    func runRecipe() {
        timeTotalLeft = recipeTimesAeropress.reduce(0, +)
        currentStep = 0
        timeStepLeft = recipeTimesAeropress[currentStep]
        
//        displayLabelsAtStart()
        timeTotalLabel.text = "\(timeTotalLeft)"
        timeTotalLabel.isHidden = false
            
        timeStepLabel.text = "\(recipeTimesAeropress[0])"
        timeStepLabel.isHidden = false

        descStepCurrentLabel.text = "\(recipeStepsAeropress[0])"
        descStepCurrentLabel.isHidden = false

        descStepNextLabel.text = " \(recipeStepsAeropress[1])"
        descStepNextLabel.isHidden = false
        descStepNextHeading.isHidden = false
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeTotalLeft -= 1
        timeStepLeft -= 1
        
        timeTotalLabel.text = "\(timeTotalLeft)"
        timeStepLabel.text = "\(timeStepLeft)"
        
        if timeTotalLeft <= 0 {
            timer.invalidate()
            descStepCurrentLabel.text = "Enjoy"
            timeStepLabel.text = "☕️"
        }
        
        if timeStepLeft <= 0 && timeTotalLeft > 0 {
            currentStep += 1
            timeStepLeft = recipeTimesAeropress[currentStep]
            descStepCurrentLabel.text = "\(recipeStepsAeropress[currentStep])"

            if currentStep + 1 < recipeStepsAeropress.count {
                descStepNextLabel.text =  " \(recipeStepsAeropress[currentStep + 1])"
            } else {
                descStepNextLabel.isHidden = true
                descStepNextHeading.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setStartScreen()
    }

    
    @IBAction func startPressed(_ sender: Any) {
        print("Start timer button was pressed")
        startRecipeButton.isHidden = true
        runRecipe()
    }
    
    @IBAction func resetReleased(_ sender: UIButton) {
        print("Reset timer button was pressed")
        timer.invalidate()
        setStartScreen()
    }
    
    
}

