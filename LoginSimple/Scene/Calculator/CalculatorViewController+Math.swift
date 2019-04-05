//
//  CalculatorViewController+Math.swift
//  LoginSimple
//
//  Created by Trương Duy Thái on 4/3/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import Foundation
extension CalculatorViewController {
    func add(a: Decimal, b: Decimal) -> Decimal {
        return a + b
    }
    
    func sub(a: Decimal, b: Decimal) -> Decimal {
        return a - b
    }
    
    func mul(a: Decimal, b: Decimal) -> Decimal {
        return a * b
    }
    
    func div(a: Decimal, b: Decimal) -> Decimal {
        return a / b
    }
    
    func percent(a: Decimal) -> Decimal {
        return a / 100
    }
    
    func convertStringToDecimal(str: String) -> Decimal {
        return NumberFormatter().number(from: str)?.decimalValue ?? 0
    }
    
    func convertIntToDecimal(a: Int) -> Decimal {
        return NumberFormatter().number(from: "\(a)")?.decimalValue ?? 0
    }
    
    func hasIndex(stringToSearch: String, charToFind: Character) -> Bool {
        return stringToSearch.firstIndex(of: charToFind) != nil
    }
    
    func replaceString(ofString: String, replaceString: String) -> String {
        return self.stringInput.replacingOccurrences(of: ofString, with: replaceString)
    }
    
    func isTyping() -> Bool {
        return self.stringInput != ""
    }
    
    func showNumber(a: Decimal) -> String {
        let numInt = Int(truncating: a as NSNumber)
        return a - convertIntToDecimal(a: numInt) != 0 ? "\(a)" : "\(numInt)"
    }
    
    func handleInput(input: String) {
        switch input {
        case ".":
            if self.buttonEqualClicked {
                self.result = 0
                self.buttonEqualClicked = false
            }
            if (self.numberInput == 0) {
                self.stringInput = "0"
            }
            if self.stringInput.firstIndex(of: ".") == nil {
                self.stringInput = "\(self.stringInput)."
            }
        case "+/-":
            if isTyping() {
                if hasIndex(stringToSearch: self.stringInput, charToFind: "-") {
                    self.stringInput = replaceString(ofString: "-", replaceString: "")
                } else {
                    self.stringInput = "-\(self.stringInput)"
                }
            } else {
                self.result = -self.result
            }
        default:
            if self.buttonEqualClicked {
                self.result = 0
                self.buttonEqualClicked = false
            }
            if input == "0" && numberInput == 0 {
                if !hasIndex(stringToSearch: self.stringInput, charToFind: ".") {
                    self.stringInput = "0"
                } else {
                    self.stringInput += input
                }
                updateDisplay()
                return
            }
            self.stringInput += input
        }
        self.numberInput = convertStringToDecimal(str: self.stringInput)
        print("numberInput = \(self.numberInput)")
        print("stringInput = \(self.stringInput)")
        updateDisplay()
    }
    
    func handleOperator(oper: String) {
        switch oper {
        case "%":
            doMath(oper: oper)
        case "=":
            doMath(oper: self.opLast == "" ? "+" : self.opLast)
            self.opLast = ""
            self.buttonEqualClicked = true
        default:
            // + - * /
            self.buttonEqualClicked = false
            if self.opLast == "" && self.result == 0 {
                self.opLast = oper
                self.result = self.numberInput
                self.numberInput = 0
                self.stringInput = ""
                return
            }
            if !isTyping() {
                self.opLast = oper
                return
            }
            doMath(oper: self.opLast)
            self.opLast = oper
        }
        
    }
    
    func doMath(oper:String) {
        switch oper {
        case "%":
            if isTyping() {
                self.numberInput = percent(a: self.numberInput)
                self.stringInput = showNumber(a: self.numberInput)
            } else {
                self.result = percent(a: self.result)
            }
            updateDisplay()
            return
        case "+":
            self.result = add(a: self.result, b: self.numberInput)
        case "-":
            self.result = sub(a: self.result, b: self.numberInput)
        case "x":
            self.result = mul(a: self.result, b: self.numberInput)
        case "/":
            self.result = div(a: self.result, b: self.numberInput)
        case "=":
            
            break
        default:
            break
        }
        self.numberInput = 0
        self.stringInput = ""
        
        updateDisplay()
    }
    
    func updateDisplay() {
        if !isTyping() {
            lbResult.text = showNumber(a: self.result)
        } else {
            if hasIndex(stringToSearch: self.stringInput, charToFind: ".") {
                lbResult.text = self.stringInput
                print("output ==> \(lbResult.text ?? "")")
                return
            }
            lbResult.text = showNumber(a: self.numberInput)
        }
        print("output ==> \(lbResult.text ?? "")")
    }
    
    func clearData() {
        lbResult.text = "0"
        self.stringInput = ""
        self.numberInput = 0
        self.opLast = ""
        self.result = 0
    }
}
