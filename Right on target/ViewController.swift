//
//  ViewController.swift
//  Right on target
//
//  Created by Игнат Гончаров on 12.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number: Int = 0
    var round: Int = 0
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func checkNumber() {
        if round == 0 {
            number = Int.random(in: 1...50)
            label.text = String(self.number)
            round = 1
        } else {
            let numSlider = Int(slider.value.rounded())
            
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else {
                points += 50
            }
            
            if round == 5 {
                let alert = UIAlertController(
                    title: "Игра окончена",
                    message: "Вы заработали \(points) очков",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(
                    title: "Начать заново",
                    style:.default,
                    handler: nil)
                )
                present(alert, animated: true, completion: nil)
                
                round = 1
                points = 0
                
            } else {
                round += 1
            }
            number = Int.random(in: 1...50)
            label.text = String(number)
        }
    }
}
