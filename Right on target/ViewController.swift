//
//  ViewController.swift
//  Right on target
//
//  Created by Игнат Гончаров on 12.08.2025.
//

import UIKit

class ViewController: UIViewController {
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }

    @IBAction func checkNumber() {
        game.calculateScore(with: Int(slider.value))
        
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }

    private func updateLabelWithSecretNumber(newText: String ) {
        label.text = newText
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Game Over",
            message: "Your score is \(score)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "Start New Game",
            style: .default,
            handler: nil)
        )
        present(alert, animated: true)
    }
}

