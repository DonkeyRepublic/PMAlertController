//
//  PMSystemAlertActionStyle.swift
//  PMAlertController
//
//  Created by Yoav Schwartz on 17/07/2017.
//  Copyright © 2017 Codeido. All rights reserved.
//

import UIKit

extension UIAlertActionStyle: PMAlertActionStyleType {
    public var titleColor: UIColor {
        switch self {
        case .default, .cancel: return UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        case .destructive: return UIColor(red: 255.0/255.0, green: 45.0/255.0, blue: 85.0/255.0, alpha: 1.0)
        }
    }

    public var font: UIFont {
        switch self {
        case .default: return UIFont.systemFont(ofSize: 17)
        case .cancel, .destructive: return UIFont.systemFont(ofSize: 17, weight: UIFontWeightSemibold)
        }
    }

    public var dismissAnimation: DismissAnimation {
        switch self {
        case .default, .destructive: return .confirm
        case .cancel: return .cancel
        }
    }
}
