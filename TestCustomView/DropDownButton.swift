//
//  DropDownButton.swift
//  TestCustomView
//
//  Created by Lai Trung Tien on 7/25/18.
//  Copyright © 2018 Lai Trung Tien. All rights reserved.
//

import UIKit
import DropDown

class DropDownButton: UIView {
    var text = ""
    var dropDown = DropDown()
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("DropDownButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.setBorderButtom(color: UIColor.blue)
        
        self.dropDown.anchorView = selectButton
        self.dropDown.bottomOffset = CGPoint.init(x: 0, y: selectButton.bounds.height)
        self.dropDown.selectionAction = { [weak self] (index, item) in
            self?.selectButton.setTitle(item, for: .normal)
            self?.text = item
        }
    }
    
    func setDataSoure(source: [String]) {
        self.dropDown.dataSource = source
        setSelection(item: source[0])
    }
    
    func setSelection(item: String) {
        selectButton.setTitle(item, for:.normal )
        text = item
    }
    
    @IBOutlet weak var selectButton: UIButton!
    
    @IBAction func clickSelect(_ sender: Any) {
        self.dropDown.show()
    }
}

extension UIView {
    func setBorderButtom(color: UIColor) {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
