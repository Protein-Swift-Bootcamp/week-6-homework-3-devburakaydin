//
//  ViewController.swift
//  homework-3
//
//  Created by Burak on 10.01.2023.
//


import UIKit
import AVFoundation

class ViewController: UICollectionViewController {
  
  var photos = Photo.allPhotos()
  
  override var preferredStatusBarStyle : UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

      collectionView?.backgroundColor = .systemBlue
    collectionView?.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
      
    // Set the PinterestLayout delegate
    if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
      layout.delegate = self
    }
  }
  
}

extension ViewController {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
    if let annotateCell = cell as? CollectionViewCell {
      annotateCell.photo = photos[indexPath.item]
    }
    return cell
  }
  
}

//MARK: - PINTEREST LAYOUT DELEGATE
extension ViewController : PinterestLayoutDelegate {
  
  // Returns the photo height
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    return photos[indexPath.item].image.size.height
  }

}

