//
//  ViewController.swift
//  CenterCollectionExample
//
//  Created by tanaka.kenji on 2016/07/01.
//  Copyright © 2016年 tanaka.kenji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftMarginViewWidth: NSLayoutConstraint!
    @IBOutlet weak var rightMarginViewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var leftMarginView: UIView!
    @IBOutlet weak var rightMarginView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [Item] = [Item(), Item(), Item()] {
        didSet {
            adjustCollectionLayout()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftMarginView.backgroundColor = UIColor.lightGrayColor()
        rightMarginView.backgroundColor = UIColor.lightGrayColor()
        collectionView.backgroundColor = UIColor.orangeColor()
        
        adjustCollectionLayout()
    }
    
    func calculateCollectionWidth() -> CGFloat {
        if items.count > 0 {
            // お好みのUICollectionViewFlowLayoutの配置分の計算をしてください
            // ここでは仮に、要素数 * 要素一つの横幅60point
            return CGFloat(items.count * 60)
        }
        return 0
    }
    
    func calculateMarginViewWidth() -> CGFloat {
        // collectionViewの横幅が親viewの横幅より値が小さかった場合のみセンター寄せさせる作り
        if calculateCollectionWidth() < view.frame.size.width {
            return (view.frame.size.width - calculateCollectionWidth()) / 2
        }
        return 0
    }
    
    func adjustCollectionLayout() {
        leftMarginViewWidth.constant = calculateMarginViewWidth()
        rightMarginViewWidth.constant = calculateMarginViewWidth()
    }
    
}
