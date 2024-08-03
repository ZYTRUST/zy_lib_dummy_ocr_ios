//
//  ParentViewController.swift
//  zy_lib_dummy_ocr_ios
//
//  Created by Jorge Saenz Ugaz on 31/07/24.
//

import Foundation

class ParentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se cargan las fuentes al iniciar las pantallas
        FontLoader.loadFonts()
    }
}
