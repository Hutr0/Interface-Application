//
//  CollectionViewController.swift
//  Interface Application
//
//  Created by Леонид Лукашевич on 17.09.2020.
//  Copyright © 2020 Hutr0. All rights reserved.
//

import UIKit

let itemPerRow: CGFloat = 2
let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

class CollectionViewController: UICollectionViewController {
    
    let images: Array<String> = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6", "dog7", "dog8", "dog9", "dog10", "dog11", "dog12", "dog13", "dog14", "dog15"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Photo Tapps"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToBig" {
            let openC = segue.destination as! OpenController
            let cell = sender as! SecondAppCell
            openC.image = cell.dogImage.image
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! SecondAppCell

        // Configure the cell
        let imageName = images[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.dogImage.image = image
    
        return cell
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemPerRow + 1)
        let availableWeight = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWeight / itemPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
