//
//  ViewController.swift
//  BoldTemplateImageRendering
//
//  Created by Tim Ekl on 6/8/17.
//  Copyright © 2017 The Omni Group. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    private var timer: Timer!
    
    private let colors = [ UIColor.red, .orange, .yellow, .green, .blue, .purple ]
    
    private func randomColor() -> UIColor {
        let index = arc4random_uniform(UInt32(colors.count))
        return colors[Int(index)]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        timer = Timer(timeInterval: 1.0, repeats: true, block: { _ in
            for cell in self.collectionView?.visibleCells ?? [] {
                cell.contentView.tintColor = self.randomColor()
            }
        })
        RunLoop.main.add(timer, forMode: .commonModes)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView = cell.contentView.subviews.flatMap({ $0 as? UIImageView }).first
        imageView?.image = UIImage(named: "boxes")!.withRenderingMode(.alwaysTemplate)
        cell.contentView.tintColor = randomColor()
        return cell
    }

}

