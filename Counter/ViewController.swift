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
        dateFormatter.dateFormat = "MMM d, yyyy HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var changeHistory: UITextView!
    
    private var counterNumber: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeHistory.isEditable = false
        changeHistory.isScrollEnabled = true
        
    }
   
    @IBAction func countPlus(_ sender: Any) {
        counterNumber+=1
        counterLabel.text = "Значение счётчика: \(counterNumber)"
        changeHistory.text += "\n \(Date().dateNow) значение изменено на +1"
    }
    
    @IBAction func countRefresh(_ sender: Any) {
        counterNumber = 0
        counterLabel.text = "Значение счётчика: \(counterNumber)"
        changeHistory.text += "\n \(Date().dateNow) значение сброшено"
    }
    
    @IBAction func countMinus(_ sender: Any) {
        if counterNumber>0 {
            counterNumber-=1
            counterLabel.text = "Значение счётчика: \(counterNumber)"
            changeHistory.text += "\n \(Date().dateNow) значение изменено на -1"
        } else {
            changeHistory.text += "\n \(Date().dateNow) попытка уменьшить значение счётчика ниже 0"
        }
    }
    
}

