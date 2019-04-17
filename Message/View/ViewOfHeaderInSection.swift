//
//  ViewOfHeaderInSection.swift
//  Message
//
//  Created by win on 4/17/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import UIKit
class DateHeaderLabel: UILabel {
    override var intrinsicContentSize: CGSize{
        let originalContent = super.intrinsicContentSize
        let height = originalContent.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        return CGSize(width: originalContent.width + 20, height: height)
    }
}
class ViewOfHeaderInSection: UIView {
    public var textLabel  : String? {
        didSet{
             labelHeader.text = textLabel
        }
    }
    let labelHeader : DateHeaderLabel = {
        let label = DateHeaderLabel()
        label.text = "12/02/2019"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(labelHeader)
        labelHeader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        labelHeader.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
