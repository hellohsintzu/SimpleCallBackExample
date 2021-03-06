//
//  PlusViewModel.swift
//  CallBack
//
//  Created by 顏莘慈 on 2021/7/10.
//

import Foundation

protocol PlusViewModelDelegate: class {
    func updateResultLabel(with result: String)
    func updateUI(with firstNumberText: String, secondNumberText: String, resultText: String)
}

class PlusViewModel: BaseViewModel {
    weak var delegate: PlusViewModelDelegate?
    
    var resultDefaultText: String {
        return "Reveal the answer"
    }
    
    var buttonText: String {
        return "reveal"
    }
    
    var resetButtonText: String {
        return "reset"
    }
    
    var numberOneText: String {
        let number = Int.random(in: 1...88)
        return "\(number)"
    }
    
    var numberTwoText: String {
        let number = Int.random(in: 1...88)
        return "\(number)"
    }
    
    func plusEqualsTo(first: String, second: String) {
        let numberOne = Int(first) ?? 0
        let numberTwo = Int(second) ?? 0
        let result = numberOne + numberTwo
        delegate?.updateResultLabel(with: "\(result)")
    }
    
    func resetState() {
        delegate?.updateUI(with: numberOneText,
                           secondNumberText: numberTwoText,
                           resultText: resultDefaultText)
    }
}
