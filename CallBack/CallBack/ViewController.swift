//
//  ViewController.swift
//  CallBack
//
//  Created by 顏莘慈 on 2021/7/10.
//

import UIKit

protocol BaseViewModel {
    var resultDefaultText: String { get }
    var buttonText: String { get }
    var resetButtonText: String { get }
    var numberOneText: String { get }
    var numberTwoText: String { get }
}

class ViewController: UIViewController {
    let multiplyViewModel = MultiplyViewModel()
    let plusViewModel = PlusViewModel()
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumebrLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var replayButton: UIButton!
    
    @IBOutlet weak var plusFirstNumberLabel: UILabel!
    @IBOutlet weak var plusSecondNumberLabel: UILabel!
    @IBOutlet weak var plusResultLabel: UILabel!
    @IBOutlet weak var plusGoButton: UIButton!
    @IBOutlet weak var plusResetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        plusViewModel.delegate = self
    }

    private func setup() {
        firstNumberLabel.text = multiplyViewModel.numberOneText
        secondNumebrLabel.text = multiplyViewModel.numberTwoText
        resultLabel.text = multiplyViewModel.resultDefaultText
        goButton.setTitle(multiplyViewModel.buttonText, for: .normal)
        replayButton.setTitle(multiplyViewModel.resetButtonText, for: .normal)
        
        plusFirstNumberLabel.text = plusViewModel.numberOneText
        plusSecondNumberLabel.text = plusViewModel.numberTwoText
        plusResultLabel.text = plusViewModel.resultDefaultText
        plusGoButton.setTitle(plusViewModel.buttonText, for: .normal)
        plusResetButton.setTitle(plusViewModel.resetButtonText, for: .normal)
    }
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        multiplyViewModel.multipliesEqualsTo(firstText: firstNumberLabel.text ?? "",
                                     secondText: secondNumebrLabel.text ?? "") {
            result in
            resultLabel.text = result
        }
    }

    @IBAction func replayButtonDidTap(_ sender: UIButton) {
        multiplyViewModel.resetState {
            (firstNum, secondNum, result) in
            firstNumberLabel.text = firstNum
            secondNumebrLabel.text = secondNum
            resultLabel.text = result
        }
    }
    
    @IBAction func plusGoButtonDidTap(_ sender: Any) {
        plusViewModel.plusEqualsTo(first: plusFirstNumberLabel.text ?? "",
                                   second: plusSecondNumberLabel.text ?? "")
    }
    
    @IBAction func plusResetButtonDidTap(_ sender: Any) {
        plusViewModel.resetState()
    }
}

extension ViewController: PlusViewModelDelegate {
    func updateUI(with firstNumberText: String, secondNumberText: String, resultText: String) {
        plusFirstNumberLabel.text = firstNumberText
        plusSecondNumberLabel.text = secondNumberText
        plusResultLabel.text = resultText
    }
    
    func updateResultLabel(with result: String) {
        plusResultLabel.text = result
    }
}
