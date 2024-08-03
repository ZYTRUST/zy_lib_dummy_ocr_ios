//
//  UIStandardButton.swift
//  zy_lib_dummy_ocr_ios
//
//  Created by Jorge Saenz Ugaz on 30/07/24.
//

import UIKit

class UIStandardButton: UIButton {

    override func draw(_ rect: CGRect) {
        //FontLoader.loadFonts()
        
        super.draw(rect)
        self.setTitleColor(.white, for: .normal)
        self.clipsToBounds = true
        self.tintColor = .white
        self.setBackgroundImage(.pixel(ofColor: UIColor(resource: ColorResource.primary)), for: .normal)
        self.titleLabel?.font = UIFont(name: "Lato-Regular", size: 20)
        self.layer.cornerRadius = 8
    }
}


extension UIImage {
  public static func pixel(ofColor color: UIColor) -> UIImage {
    let pixel = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)

    UIGraphicsBeginImageContext(pixel.size)
    defer { UIGraphicsEndImageContext() }

    guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }

    context.setFillColor(color.cgColor)
    context.fill(pixel)

    return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
  }
}
