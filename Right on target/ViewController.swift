//
//  ViewController.swift
//  Right on target
//
//  Created by Артем Бажанов on 27.03.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    var number: Int = 0
    var round: Int = 0
    var points: Int = 0
    
    @IBAction func checknumber () {
        //игра только начинается
        if self.round == 0 {
            //генерируем случайное число
            self.number = Int.random(in: 1...50)
            //передаем число текстовой метке
            self.label.text = String(self.number)
            //устанавливаем счетчик раундов на 1
            self.round = 1
        } else {
            let numSlider = Int(self.slider.value.rounded())
            //сравниваем значение с загаданным значением и считаем очки
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else {
                self.points += 50 - self.number + numSlider
            }
            if numSlider == self.number {
                self.points += 50
            }
            if self.round == 5 {
                //выводим инф.табло с результатами игры
                let alert = UIAlertController(title: "Game over", message: "Вы заработали \(self.points) очков!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
            //генерируем случайное число
            self.number = Int.random(in: 1...50)
            //передаем значение случайного числа в label
            self.label.text = String(self.number)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

