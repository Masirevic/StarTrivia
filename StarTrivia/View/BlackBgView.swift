//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/10/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import UIKit


class BlackBgView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
    
}




class BlackBGButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
    
}
