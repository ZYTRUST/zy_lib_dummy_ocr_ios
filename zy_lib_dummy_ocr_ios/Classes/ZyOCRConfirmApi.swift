//
//  ZyOCRConfirmApi.swift
//  zy_lib_dummy_ocr_ios
//
//  Created by Edwin on 05/20/2022.
//

import Foundation

class ZyOCRConfirmApi: ZyOCRConfirmDelegateProtocol {

    public typealias CallbackConfirmUI = (ZyOCRConfirmResult<Bool, Bool>) -> Void
    private var callback:CallbackConfirmUI!
    
    private var vc: UIViewController
    
    private var confirmView:ZyOCRConfirmView!
    
    public init(onView:UIViewController){
        vc = onView
    }
    
    public func showConfirm(request:ZyOCRRequest,
                            completion:@escaping CallbackConfirmUI){
        self.callback = completion
        
        confirmView = ZyOCRConfirmView.instantiate(fromStoryboard: "ZyOCR",withBundle: type(of: self))
        confirmView.modalPresentationStyle = .overCurrentContext
        confirmView.request = request
        confirmView.delegate = self
        vc.present(confirmView,animated: request.animated, completion:{})
    }
    
    func ok(data: String) {
        callback(.ok(true))
    }
    
    func cancel(data: String) {
        callback(.cancel(true))
    }
}
