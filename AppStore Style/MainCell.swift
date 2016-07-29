//
//  MainCell.swift
//  AppStore Style
//
//  Created by Ahmed Elzohry on 7/29/16.
//  Copyright © 2016 Ahmed Elzohry. All rights reserved.
//

import UIKit

private let cellIdentifier = "ItemCell"

class MainCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var group: Group? {
        didSet {
            titleLabel.text = group?.title
            collectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // register cell for reuse
        collectionView.registerNib(UINib(nibName: cellIdentifier, bundle: nil) , forCellWithReuseIdentifier: cellIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = .whiteColor()
    }
    
}

extension MainCell: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return group?.items.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as? ItemCell else { return UICollectionViewCell() }
        
        let item = group!.items[indexPath.item]
        cell.itemImageView.image = UIImage(named: "\(item.imageName)")
        cell.itemTitleLabel.text = item.title
        
        return cell
    }
}

extension MainCell: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("item at \(indexPath.item) selected")
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(150.0, 150.0)
    }
}