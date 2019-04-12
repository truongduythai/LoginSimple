//
//  WalkThroughViewController.swift
//  LoginSimple
//
//  Created by Trương Duy Thái on 4/12/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import UIKit

class WalkThroughViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPrev: UIButton!
    let cellId = NSStringFromClass(WalkThroughCell.classForCoder()).components(separatedBy: ".").last!
    
    let totalSize: Int = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        pageControl.numberOfPages = totalSize
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WalkThroughCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        handleStateActionButton(collectionView.indexPathsForVisibleItems.first!.row)
    }
    
    @IBAction func onNextPressed(_ sender: Any) {
        let currentPage = collectionView.indexPathsForVisibleItems.first!.row
        if currentPage == totalSize - 1 {
            self.navigationController?.pushViewController(SignInByCodeViewController(), animated: true)
            return
        }
        
        collectionView.scrollToItem(at: IndexPath(row: currentPage + 1, section: 0), at: .right, animated: true)
        handleStateActionButton(currentPage + 1)
    }
    
    @IBAction func onPrevPressed(_ sender: Any) {
        let currentPage = collectionView.indexPathsForVisibleItems.first!.row
        if currentPage == 0 {
            return
        }
        collectionView.scrollToItem(at: IndexPath(row: currentPage - 1, section: 0), at: .left, animated: true)
        handleStateActionButton(currentPage - 1)
    }
    
    func handleStateActionButton(_ currentPage: Int) {
        print("\(currentPage)")
        pageControl.currentPage = currentPage
        if currentPage == 0 {
            btnPrev.setTitleColor(UIColor(rgb: 0x818181), for: .normal)
            return
        }
        if currentPage == totalSize - 1 {
            btnPrev.setTitleColor(UIColor(rgb: 0xE64686), for: .normal)
            return
        }
        btnPrev.setTitleColor(UIColor(rgb: 0xE64686), for: .normal)
    }
    
}
