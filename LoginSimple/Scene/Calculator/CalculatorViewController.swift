//
//  CalculatorViewController.swift
//  LoginSimple
//
//  Created by Trương Duy Thái on 4/3/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lbResult: UILabel!
    
    var result: Decimal = 0 // result
    var numberInput: Decimal = 0 // Number user input
    var stringInput: String = ""
    var opLast: String = ""
    var buttonEqualClicked: Bool = false
    
    
    var buttons = ["AC","+/-","%","/","7","8","9","x","4","5","6","-","1","2","3","+","0", ".","=", ""]
    let cell = "CalculatorCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: self.cell, bundle: nil), forCellWithReuseIdentifier: self.cell)
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.minimumLineSpacing = 1.5
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.buttons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! CalculatorCell
        switch self.buttons[indexPath.row] {
        case "AC","+/-","%","C":
            cell.backgroundColor = UIColor(rgb: 0x444548)
        case "/","x","-","+","=":
            cell.backgroundColor = UIColor(rgb: 0xFD9E2B)
        default:
            cell.backgroundColor = UIColor(rgb: 0x626368)
        }
        cell.lbTitle.text = self.buttons[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenRect = UIScreen.main.bounds
        let width = screenRect.size.width
        let height = width * 1.1
        if indexPath.row == 16 {
            return CGSize(width: (width / 4) * 2 - 1, height: height / 5 - 1)
        }
        return CGSize(width: width / 4 - 1.5, height: height / 5 - 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch self.buttons[indexPath.row] {
        case "1","2","3","4","5","6","7","8","9","0",".","+/-":
            handleInput(input: self.buttons[indexPath.row])
            self.buttons[0] = "C"
            self.collectionView.reloadItems(at: [IndexPath(item: 0, section: 0)])
        case "+","-","x","/","=","%":
            handleOperator(oper: self.buttons[indexPath.row])
        case "AC", "C":
            clearData()
            self.buttons[0] = "AC"
            self.collectionView.reloadItems(at: [IndexPath(item: 0, section: 0)])
        default:
            print("default")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = self.collectionView.cellForItem(at: indexPath) as? CalculatorCell {
            cell.transform = .init(scaleX: 0.97, y: 0.97)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = self.collectionView.cellForItem(at: indexPath) as? CalculatorCell {
            cell.transform = .identity
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
