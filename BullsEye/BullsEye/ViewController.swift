//
//  ViewController.swift
//  BullsEye
//
//  Created by William Friedrich on 8/2/18.
//  Copyright © 2018 William Friedrich Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var currentRound: Int = 0
    var currentScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        currentRound = currentRound + 1
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        score.text = String(currentScore)
        round.text = String(currentRound)
    }

    @IBAction func showAlert() {
        var difference: Int
        
        if currentValue > targetValue {
            difference = currentValue - targetValue
        } else if targetValue > currentValue {
            difference = targetValue - currentValue
        } else {
            difference = 0
        }
        
        let message = "The value of the slider is \(currentValue)" + "\nThe target value is: \(targetValue)" + "\nThe difference is \(difference)"
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in self.startNewRound()})
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver() {
        currentScore = 0
        currentRound = 0
        startNewRound()
    }
}

