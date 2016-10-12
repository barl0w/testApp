//
//  MaterialView.swift
//  Trump vs Hillary
//
//  Created by Kiddos on 10/12/16.
//  Copyright © 2016 Team Apps. All rights reserved.
//

import UIKit

class MaterialView: UIView {
    
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(displayP3Red: SHAWDOW_COLOR, green: SHAWDOW_COLOR, blue: SHAWDOW_COLOR, alpha: 0.5).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    }
    
}

