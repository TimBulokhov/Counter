//
//  ViewController.swift
//  Counter
//
//  Created by Timofey Bulokhov on 18.10.2023.
//

import UIKit
extension Date {
    var dateNow: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, YYYY HH:MM:SS"
        return dateFormatter.string(from: self)
    }
}
class ViewController: UIViewController {
    private var counterNumber: Int = 0
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var refreshButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var changeHistory: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeHistory.isEditable = false
        changeHistory.isScrollEnabled = true
        
    }
    
    @IBAction private func countPlus(_ sender: Any) {
        counterNumber+=1
        counterLabel.text = "Значение счётчика: \(counterNumber)"
        changeHistory.text += "\n \(Date().dateNow) значение изменено на +1"
    }
    
    @IBAction private func countRefresh(_ sender: Any) {
        counterNumber = 0
        counterLabel.text = "Значение счётчика: \(counterNumber)"
        changeHistory.text += "\n \(Date().dateNow) значение сброшено"
    }
    
    @IBAction private func countMinus(_ sender: Any) {
        if counterNumber>0 {
            counterNumber-=1
            counterLabel.text = "Значение счётчика: \(counterNumber)"
            changeHistory.text += "\n \(Date().dateNow) значение изменено на -1"
        } else {
            changeHistory.text += "\n \(Date().dateNow) попытка уменьшить значение счётчика ниже 0"
        }
    }
    
}

