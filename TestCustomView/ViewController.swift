//
//  ViewController.swift
//  TestCustomView
//
//  Created by Lai Trung Tien on 7/23/18.
//  Copyright © 2018 Lai Trung Tien. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ImageButtonDelegate, CodeInputViewDelegate, UploadButtonDelegate {
    @IBOutlet weak var uploadButton: UploadButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUploadButton()
        setupDropDownButton()
        setup2HeadRoundButton()
        setupImageButton()
        setupTextFieldBoder()
        setupOTP()
    }
    
    //MARK: - Upload Button
    func setupUploadButton() {
        uploadButton.delegate = self
    }
    
    func clickUploadButton(sender: Any) {
        print("upload")
    }
    
    //MARK: - Dropdown Button
    @IBOutlet weak var dropdownButton: DropDownButton!
    func setupDropDownButton() {
        dropdownButton.setDataSoure(source: ["Vietnam", "Singapore"])
    }
    
    //MARK: - 2 head Round button
    @IBOutlet weak var button: UIButton!
    func setup2HeadRoundButton() {
        button.layer.cornerRadius = button.frame.size.height / 2
    }
    
    //MARK: - ImageButton (continue button)
    @IBOutlet weak var imageButton: ImageButton!
    func setupImageButton() {
        imageButton.delegate = self
    }
    
    func imageButtonClick(_ sender: Any) {
        print("Clicked")
    }
    
    //MARK: - Textfield with bottom border
    @IBOutlet weak var textField: UITextField!
    func setupTextFieldBoder() {
        textField.setBottomBorder(color: UIColor.init(argb: 0xff009cff))
        textField.attributedPlaceholder = NSAttributedString(string: "Email",attributes: [NSAttributedStringKey.foregroundColor: UIColor.gray])
    }
    
    //MARK: - Setup OTP
    fileprivate func setupOTP() {
        let frame = CGRect(x: (view.frame.width-315)/2, y: 242, width: 315, height: 60)
        let codeInputView = CodeInputView(frame: frame)
        codeInputView.delegate = self
        view.addSubview(codeInputView)
        codeInputView.becomeFirstResponder()
    }
    
    func codeInputView(_ codeInputView: CodeInputView, didFinishWithCode code: String) {
        let title = (code == "123456" ? "Correct!" : "Wrong!")
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel) { _ in codeInputView.clear() })
        present(alert, animated: true)
    }
}

