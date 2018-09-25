//
//  CustomTableViewCell.swift
//  BasicCustomTableViewCellToViewControllerCommunication
//
//  Created by Milos Dimic on 9/25/18.
//  Copyright © 2018 Milos Dimic. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate: class {
    func didTapButtonMain(inCell cell: CustomTableViewCell)
    func didTapimageViewMain(inCell cell: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var buttonMain: UIButton!
    @IBOutlet weak var imageViewMain: UIImageView!
    
    weak var delegate: CustomTableViewCellDelegate?
    
    // MARK: - View life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupGestureRecognizers()
    }
    
    // MARK: - Gesture Handlers
    
    private func setupGestureRecognizers() {
        imageViewMain?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewActionTapped(_:))))
    }

    // MARK: -  Action methods
    
    @IBAction func buttonMainTapped(_ sender: UIButton) {
        delegate?.didTapButtonMain(inCell: self)
    }
    
    @objc private func imageViewActionTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        delegate?.didTapimageViewMain(inCell: self)
    }
    
}
