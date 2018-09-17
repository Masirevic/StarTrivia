//
//  FadeEnabledBtn.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/11/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import UIKit


class FadeEnabledBtn: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                     self.alpha = 1.0
                }
               
            } else {
                self.alpha = 0.5
            }
        }
    }
}


