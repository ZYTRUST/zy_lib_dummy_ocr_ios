//
//  ZyFonts.swift
//  Pods-zy_lib_dummy_ocr_ios_Example
//
//  Created by Developer on 30/07/24.
//

import UIKit
import CoreText

public class FontLoader {
    public static func loadFonts() {
        guard let bundle = Bundle(for: self) as? Bundle else {
            //print("Failed to get bundle")
            return
        }
        
        let fontURLs = [
            bundle.url(forResource: "Lato-Bold", withExtension: "ttf"),
            bundle.url(forResource: "Lato-Black", withExtension: "ttf"),
            bundle.url(forResource: "Lato-Italic", withExtension: "ttf"),
            bundle.url(forResource: "Lato-Light", withExtension: "ttf"),
            bundle.url(forResource: "Lato-Regular", withExtension: "ttf"),
            bundle.url(forResource: "Lato-Thin", withExtension: "ttf")
        ]
        
        for fontURL in fontURLs {
            guard let url = fontURL else { continue }
            let fontDataProvider = CGDataProvider(url: url as CFURL)
            guard let font = CGFont(fontDataProvider!) else {
                //print("Failed to create CGFont from \(url)")
                continue
            }
            
            var error: Unmanaged<CFError>?
            if CTFontManagerRegisterGraphicsFont(font, &error) {
                //print("Font loaded successfully from \(url)")
            } else {
                //print("Failed to load font from \(url): \(error?.takeUnretainedValue().localizedDescription ?? "Unknown error")")
            }
        }
        
        //listAllFonts()
    }
    
    public static func listAllFonts() {
        for familyName in UIFont.familyNames {
            print("Family: \(familyName)")
            
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("  Font: \(fontName)")
            }
        }
    }    
}
