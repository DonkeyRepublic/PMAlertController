//
//  PMAlertAction.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit

@objc public enum PMDefaultAlertActionStyle : Int {
    
    case `default`
    case cancel
}

extension PMDefaultAlertActionStyle: PMAlertActionStyleType {
    public var titleColor: UIColor {
        switch self {
        case .default: return UIColor(red: 191.0/255.0, green: 51.0/255.0, blue: 98.0/255.0, alpha: 1.0)
        case .cancel:return UIColor.gray
        }
    }

    public var font: UIFont {
        switch self {
        case .default: return UIFont(name: "Avenir-Heavy", size: 17)!
        case .cancel: return UIFont(name: "Avenir-Heavy", size: 17)!
        }
    }

    public var dismissAnimation: DismissAnimation {
        switch self {
        case .default: return .confirm
        case .cancel: return .cancel
        }
    }
}

public protocol PMAlertActionStyleType {
    var titleColor: UIColor { get }
    var font: UIFont { get }
    var dismissAnimation: DismissAnimation { get }
}

public enum DismissAnimation: Int {
    case confirm
    case cancel
}

@objc open class PMAlertAction: UIButton {
    
    fileprivate var action: (() -> Void)?
    
    open var actionStyle : PMAlertActionStyleType
    
    var separator = UIImageView()
    
    init(){
        self.actionStyle = PMDefaultAlertActionStyle.cancel
        super.init(frame: CGRect.zero)
    }
    
    public convenience init(title: String?, style: PMAlertActionStyleType, action: (() -> Void)? = nil){
        self.init()
        self.action = action
        self.addTarget(self, action: #selector(PMAlertAction.tapped(_:)), for: .touchUpInside)
        
        self.setTitle(title, for: UIControlState())
        
        self.actionStyle = style
        self.setTitleColor(style.titleColor, for: .normal)
        self.titleLabel?.font = style.font
        
        self.addSeparator()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapped(_ sender: PMAlertAction) {
        self.action?()
    }
    
    @objc fileprivate func addSeparator(){
        separator.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        self.addSubview(separator)
        
        // Autolayout separator
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        separator.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
        separator.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
}
