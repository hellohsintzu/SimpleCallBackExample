//
//  ViewModel.swift
//  CallBack
//
//  Created by 顏莘慈 on 2021/7/10.
//

import Foundation

class MultiplyViewModel: BaseViewModel {
    
    let resultDefaultText = "Waiting for result...."
    let buttonText = "Go!"
    let resetButtonText = "Reset"

    var numberOneText: String {
        let randomNumOne = Int.random(in: 1...10)
        return "\(randomNumOne)"
    }
    
    var numberTwoText: String {
        let randonNumTwo = Int.random(in: 1...10)
        return "\(randonNumTwo)"
    }
    
    func multipliesEqualsTo(firstText: String, secondText: String, handler: (_ result: String) -> Void) {
        let firstNumber = Int(firstText) ?? 0
        let secondNumber = Int(secondText) ?? 0
        let result = firstNumber * secondNumber
        handler("\(result)")
    }
    
    func resetState(handler: ((firstNum: String, secondNum: String, resultText: String)) -> Void) {
        handler((numberOneText, numberTwoText, resultDefaultText))
    }
}
