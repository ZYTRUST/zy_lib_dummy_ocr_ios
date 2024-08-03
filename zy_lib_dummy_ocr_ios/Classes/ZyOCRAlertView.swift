//
//  ZyOCRAlertView.swift
//  zy_lib_dummy_ocr_ios
//
//  Created by Edwin on 05/20/2022.
//

import Foundation

protocol ZyOCRAlertDelegateProtocol{
    func ok(data:String)
}

class ZyOCRAlertView: ParentViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var ivAdvertenciaOcr: UIImageView!
    
    @IBAction func onPressedOk(_ sender: Any) {
        if self.delegate != nil {
            self.delegate?.ok(data: "OK")
            self.dismissMe(animated: request.animated, completion: nil)
        }
    }
    
    var request = ZyOCRRequest()
    var delegate : ZyOCRAlertDelegateProtocol? = nil
    private var vc: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblMessage.text = request.message
        lblMessage.fontRegular()
        
        lblDescripcion.text = request.description
        lblDescripcion.fontRegular(fSize: 16)
        
        btnOk.setTitle(request.lblOk, for: .normal)
        btnOk.setTitleColor(UIColor(hex: request.titleHexColorOk), for: .normal)
        btnOk.backgroundColor = UIColor(hex: request.bgHexColorOk)
        
        self.ivAdvertenciaOcr.setLottieAnimationView(psImageName: "lottie_ocr_demo_anim")
    }
    
}
