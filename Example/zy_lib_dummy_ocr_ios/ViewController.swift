//
//  ViewController.swift
//  zy_lib_dummy_ocr_ios
//
//  Created by Edwin Sanchez on 05/19/2022.
//  Copyright (c) 2022 Edwin Sanchez. All rights reserved.
//

import UIKit
import zy_lib_dummy_ocr_ios
import Pods_zy_lib_dummy_ocr_ios_Example

class ViewController: UIViewController {


    @IBAction func fnConfirm(_ sender: Any) {
        confirm()
    }
    
    
    @IBAction func fnAlert(_ sender: Any) {
        alert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func confirm(){
        let apiUI = ZyApiOCR(onView: self)
        var req = ZyOCRRequest()
        req.lblOk="Entendido"
        req.titleHexColorOk="#FFFFFFFF"
        req.bgHexColorOk="#925AF5FF"
        req.lblCancel="En otro momento"
        req.titleHexColorCancel="#925AF5FF"
        req.message = "No pudimos validar tu identidad. Por favor volver a intentarlo"
        req.animated = true
        
        apiUI.showConfirm(request: req)
        { (result:(ZyOCRConfirmResult<Bool, Bool>)) in
            switch result {
                case .ok(let ok):
                    print("ok pressed")
                case .cancel(let cancel):
                    print("cancel pressed")
            }
        }
    }
    
    func alert(){
        let apiUI = ZyApiOCR(onView: self)
        var req = ZyOCRRequest()
        req.lblOk="Entendido ok"
        req.titleHexColorOk="#FFFFFFFF"
        req.bgHexColorOk="#925AF5FF"
        req.message = "Superaste la maxima cantidad de intentos"
        req.description = "No pudimos validar tu identidad iintentalo nuevamente mas tarde"
        req.animated = true
        
        apiUI.showAlert(request: req)
        { (result:(ZyOCRAlertResult<Bool>)) in
            switch result {
                case .ok(let ok):
                    print("ok pressed")
            }
        }
    }
}

