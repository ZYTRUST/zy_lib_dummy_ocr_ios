//
//  ZyApiUI.swift
//  zy_lib_dummy_ocr_ios
//
//  Created by Edwin on 05/20/2022.
//

import Foundation

public class ZyApiOCR {
    
    public typealias CallbackConfirmUI = (ZyOCRConfirmResult<Bool, Bool>) -> Void
    public typealias CallbackAlertUI = (ZyOCRAlertResult<Bool>) -> Void
    
    private var vc: UIViewController
    
    public init(onView:UIViewController){
        vc = onView
    }
    
    public func showConfirm(request:ZyOCRRequest,
                            completion:@escaping CallbackConfirmUI){
        let confirmApi = ZyOCRConfirmApi(onView: vc)
        confirmApi.showConfirm(request: request)
        { (result:(ZyOCRConfirmResult<Bool, Bool>)) in
            
            switch result {
                case .ok(let result):
                    completion(.ok(result))
                case .cancel(let result):
                    completion(.cancel(result))
            }
        }
    }
    
    public func showAlert(request:ZyOCRRequest,
                          completion:@escaping CallbackAlertUI){
        let api = ZyOCRAlertApi(onView: vc)
        api.showAlert(request: request)
        { (result:(ZyOCRAlertResult<Bool>)) in
            
            switch result {
                case .ok(let result):
                    completion(.ok(result))
            }
        }
    }
    
    
}
