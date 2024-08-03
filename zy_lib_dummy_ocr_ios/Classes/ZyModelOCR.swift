//
//  ZyModelUI.swift
//  zy_lib_dummy_ocr_ios
//
//  Created by Edwin on 05/20/2022.
//

import Foundation

public struct ZyOCRRequest{
    public init(){}
    
    public var message: String?
    public var description: String?
    
    public var lblOk: String?
    public var titleHexColorOk: String="#FFFFFFFF"
    public var bgHexColorOk: String="#925AF5FF"
    
    public var lblCancel: String?
    public var titleHexColorCancel: String="#925AF5FF"
    public var bgHexColorCancel: String="" //no background default
    
    public var animated: Bool=true
}

public enum ZyOCRConfirmResult <T,C> {
    case ok(T)
    case cancel(C)
}

public enum ZyOCRAlertResult <T> {
    case ok(T)
}
