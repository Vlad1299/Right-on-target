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
    var round: Int = 1
    var points: Int = 0
    
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewDidLoad")
        number = Int.random(in: 1...50)
        label.text = String(self.number)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewDidDisappear")
    }
    
    @IBAction func checkNumber() {
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

    private func getSecondViewController() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        return viewController as! SecondViewController
    }
}

