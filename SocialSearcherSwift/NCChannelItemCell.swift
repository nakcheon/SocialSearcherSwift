//
//  NCChannelItemCell.swift
//  SocialSearcherSwift
//
//  Created by NakCheon Jung on 12/11/2017.
//  Copyright © 2017 ncjung. All rights reserved.
//

import UIKit


protocol NCChannelItemCellDelegate: NSObjectProtocol {
    func actionCellCoveringButtonClicked()
}

class NCChannelItemCell: UICollectionViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewImage: UIImageView!
    weak var delegate: NCChannelItemCellDelegate?
    
    // MARK: - Public
    
    func configure() {
        self._createRoundedCorner()
    }
    
    // MARK - Private
    func _createRoundedCorner() {
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
    }
    
    // MARK: - Actions
    
    @IBAction func actionCellCoveringButtonClicked(_ sender: Any) {
        print("NCChannelItemCell::actionCellCoveringButtonClicked")
        self.delegate?.actionCellCoveringButtonClicked()
    }
    
}
