//
//  SecondViewController.swift
//  Right on target
//
//  Created by Игнат Гончаров on 13.08.2025.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet var unknownColorLabel: UILabel!
    @IBOutlet var roudCounter: UILabel!
    @IBOutlet var answer1Button: UIButton!
    @IBOutlet var answer2Button: UIButton!
    @IBOutlet var answer3Button: UIButton!
    @IBOutlet var answer4Button: UIButton!
    
    var unknownnColor: UIColor!
    var colors = [UIColor]()
    var score: Int = 0
    var round: Int = 1
    var totalRounds: Int = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRandomColors()
        answer1Button.layer.cornerRadius = 10
        answer2Button.layer.cornerRadius = 10
        answer3Button.layer.cornerRadius = 10
        answer4Button.layer.cornerRadius = 10
        
        roudCounter.text = "\(round)/\(totalRounds)"
    }
    
    func setupRandomColors() {
        for _ in 0..<4 {
            let color = UIColor(
                red: CGFloat.random(in: 0...255) / 255.0,
                green: CGFloat.random(in: 0...255) / 255.0,
                blue: CGFloat.random(in: 0...255) / 255.0,
                alpha: 1
            )
            colors.append(color)
        }
        answer1Button.backgroundColor = colors[0]
        answer2Button.backgroundColor = colors[1]
        answer3Button.backgroundColor = colors[2]
        answer4Button.backgroundColor = colors[3]
        unknownnColor = colors.randomElement()
        unknownColorLabel.text = unknownnColor?.toHex()
    }

    @IBAction func buttonDidTapped(_ sender: UIButton) {
        if round == totalRounds {
            endGame()
            
        } else {
            sender.backgroundColor == unknownnColor ? score += 1 : ()
            round += 1
            roudCounter.text = "\(round)/\(totalRounds)"
            startNewRound()
        }
    }
    
    func startNewRound() {
        colors.removeAll()
        setupRandomColors()
    }
    
    func endGame() {
        alertFunc()
        score = 0
        round = 1
        startNewRound()
        roudCounter.text = "\(round)/\(totalRounds)"
    }
    
    func alertFunc() {
        let alertController = UIAlertController(title: "Game Over!", message: "You're  score: \(score)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Restart", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

extension UIColor {
    func toHex() -> String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else { return nil }
        
        let r = Int(red * 255)
        let g = Int(green * 255)
        let b = Int(blue * 255)
        
        return String(format: "#%02X%02X%02X", r, g, b)
    }
}
