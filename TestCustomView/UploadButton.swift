//
//  UploadButton.swift
//  TestCustomView
//
//  Created by Lai Trung Tien on 7/25/18.
//  Copyright © 2018 Lai Trung Tien. All rights reserved.
//

import UIKit

class UploadButton: UIView {
    var delegate: UploadButtonDelegate?
    @IBOutlet var contentView: UIView!
    
    @IBAction func clickUploadButton(_ sender: Any) {
        delegate?.clickUploadButton(sender: sender)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("UploadButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.layer.cornerRadius = frame.size.height / 2
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.white.cgColor
        clipsToBounds = true
    }
}

protocol UploadButtonDelegate {
    func clickUploadButton(sender: Any)
}
