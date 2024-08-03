//
//  ZyOCRView.swift
//  zy_lib_dummy_ocr_ios
//
//  Created by Edwin on 05/20/2022.
//

import Foundation

protocol ZyOCRConfirmDelegateProtocol{
    
    func ok(data:String)
    func cancel(data:String)
}

class ZyOCRConfirmView: ParentViewController{
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var ivAdvertenciaOcr: UIImageView!
    
    @IBAction func onPressedOk(_ sender: Any) {
        if self.delegate != nil {
            self.delegate?.ok(data: "OK")
            self.dismissMe(animated: request.animated, completion: nil)
        }
    }
    
    @IBAction func onPressedCancel(_ sender: Any) {
        if self.delegate != nil {
            self.delegate?.cancel(data: "OK")
            self.dismissMe(animated: request.animated, completion: nil)
        }
    }
    
    var request = ZyOCRRequest()
    var delegate : ZyOCRConfirmDelegateProtocol? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.text = request.message
        lblMessage.fontRegular()
        
        btnOk.setTitle(request.lblOk, for: .normal)
        
        btnCancel.setTitleColor(UIColor(hex: request.titleHexColorCancel), for: .normal)
        btnCancel.backgroundColor = UIColor(hex: request.bgHexColorCancel)
        btnCancel.setTitle(request.lblCancel, for: .normal)
        
        self.ivAdvertenciaOcr.setLottieAnimationView(psImageName: "lottie_ocr_demo_anim")
        
    }
}
