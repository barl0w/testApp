//
//  roundImage.swift
//  Trump vs Hillary
//
//  Created by Kiddos on 10/12/16.
//  Copyright © 2016 Team Apps. All rights reserved.
//

import UIKit

class roundImage : UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
}
