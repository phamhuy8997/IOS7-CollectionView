//
//  ViewController.swift
//  App3-1
//
//  Created by Huy Pham on 5/6/17.
//  Copyright © 2017 Huy Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var LogoImage : [UIImage]!
    
    var scrollingTimer = Timer()
    
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LogoImage = [
            UIImage(named: "App3image11.png")!,
            UIImage(named: "App3image12.png")!,
            UIImage(named: "App3image13.png")!,
            UIImage(named: "App3image14.png")!,
            UIImage(named: "App3image15.png")!,
        ]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LogoImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        let image = cell.viewWithTag(100) as! UIImageView
        image.image = LogoImage[indexPath.row]
        
        var rowIndex = indexPath.row
        let numberOfRecords : Int = self.LogoImage.count - 1
        if rowIndex < numberOfRecords {
            rowIndex = rowIndex + 1
        }
        else {
            rowIndex = 0
        }
        
        scrollingTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(ViewController.startTimer(theTimer: )), userInfo: rowIndex, repeats: true)
        
        return cell
    }
    
    func startTimer(theTimer: Timer) {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
            self.CollectionView.scrollToItem(at: IndexPath(row: theTimer.userInfo! as! Int, section: 0), at: .centeredHorizontally, animated: false)
        }, completion: nil )
    }


}

