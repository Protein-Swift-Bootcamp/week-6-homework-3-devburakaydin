//
//  CollectionViewCell.swift
//  homework-3
//
//  Created by Burak on 10.01.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet fileprivate weak var containerView: UIView!
    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var captionLabel: UILabel!
    @IBOutlet fileprivate weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
      super.awakeFromNib()
      containerView.layer.cornerRadius = 6
      containerView.layer.masksToBounds = true
    }
    
    var photo: Photo? {
      didSet {
        if let photo = photo {
          imageView.image = photo.image
          captionLabel.text = photo.caption
          commentLabel.text = photo.comment
        }
      }
    }
    
}
