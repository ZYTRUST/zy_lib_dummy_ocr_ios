//
//  ZyOCRAlertApi.swift
//  zy_lib_dummy_ocr_ios
//
//  Created by Edwin on 05/20/2022.
//

import Foundation

class ZyOCRAlertApi: ZyOCRAlertDelegateProtocol {

    public typealias CallbackAlertUI = (ZyOCRAlertResult<Bool>) -> Void
    private var callback:CallbackAlertUI!
    
    private var vc: UIViewController
    
    private var alertView:ZyOCRAlertView!
    
    public init(onView:UIViewController){
        vc = onView
    }
    
    public func showAlert(request:ZyOCRRequest,
                          completion:@escaping CallbackAlertUI){
        self.callback = completion
        
        alertView = ZyOCRAlertView.instantiate(fromStoryboard: "ZyOCR",withBundle: type(of: self))
        alertView.modalPresentationStyle = .overCurrentContext
        alertView.request = request
        alertView.delegate = self
        vc.present(alertView,animated: request.animated, completion:{})
    }
    
    func ok(data: String) {
        callback(.ok(true))
    }
}
