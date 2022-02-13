//
//  UIDevice+Extension.swift
//  Medica-Egypt-iOS
//
//  Created by Mina Shehata on 1/28/19.
//  Copyright © 2019 Mina Shehata. All rights reserved.
//

import UIKit

public enum Model : String {
    case simulator   = "simulator/sandbox",
    iPod1            = "iPod 1",
    iPod2            = "iPod 2",
    iPod3            = "iPod 3",
    iPod4            = "iPod 4",
    iPod5            = "iPod 5",
    iPad2            = "iPad 2",
    iPad3            = "iPad 3",
    iPad4            = "iPad 4",
    iPhone4          = "iPhone 4",
    iPhone4S         = "iPhone 4S",
    iPhone5          = "iPhone 5",
    iPhone5S         = "iPhone 5S",
    iPhone5C         = "iPhone 5C",
    iPadMini1        = "iPad Mini 1",
    iPadMini2        = "iPad Mini 2",
    iPadMini3        = "iPad Mini 3",
    iPadAir1         = "iPad Air 1",
    iPadAir2         = "iPad Air 2",
    iPadPro9_7       = "iPad Pro 9.7\"",
    iPadPro9_7_cell  = "iPad Pro 9.7\" cellular",
    iPadPro10_5      = "iPad Pro 10.5\"",
    iPadPro10_5_cell = "iPad Pro 10.5\" cellular",
    iPadPro12_9      = "iPad Pro 12.9\"",
    iPadPro12_9_cell = "iPad Pro 12.9\" cellular",
    iPhone6          = "iPhone 6",
    iPhone6plus      = "iPhone 6 Plus",
    iPhone6S         = "iPhone 6S",
    iPhone6Splus     = "iPhone 6S Plus",
    iPhoneSE         = "iPhone SE",
    iPhone7          = "iPhone 7",
    iPhone7plus      = "iPhone 7 Plus",
    iPhone8          = "iPhone 8",
    iPhone8plus      = "iPhone 8 Plus",
    iPhoneX          = "iPhone X",
    iPhoneXS         = "iPhone XS",
    iPhoneXSmax      = "iPhone XS Max",
    iPhoneXR         = "iPhone XR",
    unrecognized     = "?unrecognized?"
    
    
    var currentModel: Model {
        switch self {
        case .iPod1:
            return .iPod1
        case .iPod2:
            return .iPod2
        case .iPod3:
            return .iPod3
        case .iPod4:
            return .iPod4
        case .iPod5:
            return .iPod5
            
        case .iPad2:
            return .iPad2
        case .iPad3:
            return .iPad3
        case .iPad4:
            return .iPad4
        case .iPhone4:
            return .iPhone4
        case .simulator:
            return .simulator
        case .iPhone4S:
            return .iPhone4S
        case .iPhone5:
            return .iPhone5
        case .iPhone5S:
            return .iPhone5S
        case .iPhone5C:
            return .iPhone5C
        case .iPadMini1:
            return .iPadMini1
        case .iPadMini2:
            return .iPadMini2
        case .iPadMini3:
            return .iPadMini3
        case .iPadAir1:
            return .iPadAir1
        case .iPadAir2:
            return .iPadAir2
        case .iPadPro9_7:
            return .iPadPro9_7
        case .iPadPro9_7_cell:
            return .iPadPro9_7_cell
        case .iPadPro10_5:
            return .iPadPro10_5
        case .iPadPro10_5_cell:
            return .iPadPro10_5_cell
        case .iPadPro12_9:
            return .iPadPro12_9
        case .iPadPro12_9_cell:
            return .iPadPro12_9_cell
        case .iPhone6:
            return .iPhone6
        case .iPhone6plus:
             return .iPhone6plus
        case .iPhone6S:
            return .iPhone6S
        case .iPhone6Splus:
            return .iPhone6Splus
        case .iPhoneSE:
            return .iPhoneSE
        case .iPhone7:
            return .iPhone7
        case .iPhone7plus:
            return .iPhone7plus
        case .iPhone8:
            return .iPhone8
        case .iPhone8plus:
            return .iPhone8plus
        case .iPhoneX:
            return .iPhoneX
        case .iPhoneXS:
            return .iPhoneX
        case .iPhoneXSmax:
            return .iPhoneX
        case .iPhoneXR:
            return .iPhoneX
        case .unrecognized:
            return .unrecognized
        }
    }
    
}

public extension UIDevice {
     var type: Model {
        get {
            return Model(rawValue: UIDevice.current.name)?.currentModel ?? Model.unrecognized
        }
        
        
    }
}
