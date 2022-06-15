//
//  ViewController.swift
//  BullsEye
//
//  Created by boss1234 on 06/05/2022.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var label:UILabel!
    @IBOutlet weak var totalScoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    var totalScore = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
    }
    func startNewRound(){
        targetValue = 1 +  Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabel()
    }
    @IBAction func sliderMoved(_ slider:UISlider){
        currentValue = lroundf(slider.value)
    }
    @IBAction func startOver(){
        totalScore = 0
        round  = 0
        startNewRound()
    }
    func updateLabel(){
        label.text = String(targetValue)
        totalScoreLabel.text = String(totalScore)
        roundLabel.text = String(round)


    }
    @IBAction func shwoAlert(){
        let difference = abs(targetValue - currentValue)
        var points = 100  - difference
        let message = "You score \(points) points"
        let title :String
        if difference == 0{
            title = "Perfrect!"
            points += 100
        }else if difference < 5{
            title = "You almost had it!"
            points += 50
            
        }else if difference < 10{
            title = "Pretty good!"
        }else{
            title = "Not even close..."
        }
        totalScore += points

        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awsome!", style: .default, handler:{
            action in
            self.startNewRound()
        } )//closures
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }


}

