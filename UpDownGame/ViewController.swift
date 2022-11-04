//
//  ViewController.swift
//  UpDown
//
//  Created by yongseopKim on 2022/09/05.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    //MARK: IBOutlet
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var turnCountLabel: UILabel!
    @IBOutlet var inputField: UITextField!
    
    
    var randomNumber: UInt32 = 0
    var turnCount: Int = 0
    
    
    
    //MARK:- Methods
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        guard let inputText = self.inputField.text,
              inputText.isEmpty == false else {
            print("입력값 없음")
            return
        }
        
        guard let inputNumber: UInt32 = UInt32(inputText) else {
            print("입력값이 잘못 되었음")
            return
        }
        
        turnCount += 1
        self.turnCountLabel.text = "\(turnCount)"
        
        if inputNumber > randomNumber {
            self.resultLabel.text = "이건 너무 큰데?"
        } else if inputNumber < randomNumber {
            self.resultLabel.text = "그거밖에 안돼?"
        } else {
            self.resultLabel.text = "정답!"
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
    }
    
    func initializeGame() {
        self.randomNumber = arc4random() % 25
        self.turnCount = 0
        
        self.resultLabel.text = "Start!"
        self.turnCountLabel.text = "\(turnCount)"
        self.inputField.text = nil
        
        print("임의의 숫자 \(self.randomNumber)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeGame()
    }


}

