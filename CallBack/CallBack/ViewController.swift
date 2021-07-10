//
//  ViewController.swift
//  CallBack
//
//  Created by 顏莘慈 on 2021/7/10.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = ViewModel()
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumebrLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var buttonText: UIButton!
    @IBOutlet weak var replayText: UIButton!
    
    private func setup() {
        firstNumberLabel.text = viewModel.numberOneText
        secondNumebrLabel.text = viewModel.numberTwoText
        resultLabel.text = viewModel.resultDefaultText
        buttonText.setTitle(viewModel.buttonText, for: .normal)
        replayText.setTitle(viewModel.replyButtonText, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @IBAction func buttonDidTap(_ sender: UIButton) {
        viewModel.multipliesEqualsTo(firstText: firstNumberLabel.text ?? "",
                                     secondText: secondNumebrLabel.text ?? "") { result in
            resultLabel.text = result
        }
    }

    @IBAction func replayButtonDidTap(_ sender: UIButton) {
        viewModel.resetState { (firstNum, secondNum, result) in
            firstNumberLabel.text = firstNum
            secondNumebrLabel.text = secondNum
            resultLabel.text = result
        }
    }
}

