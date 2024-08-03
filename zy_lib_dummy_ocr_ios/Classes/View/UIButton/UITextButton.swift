//
//  UITextButton.swift
//  zy_lib_dummy_ocr_ios
//
//  Created by Jorge Saenz Ugaz on 30/07/24.
//

import Foundation

class UITextButton: UIButton {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setTitleColor(UIColor(resource: ColorResource.primary), for: .normal)
        self.clipsToBounds = true
        self.tintColor = UIColor(resource: ColorResource.primary)
        //self.setBackgroundImage(.pixel(ofColor: UIColor(resource: ColorResource.primary)), for: .normal)
        self.titleLabel?.font = UIFont(name: "Lato-Regular", size: 20)
        self.layer.cornerRadius = 8
    }
}
