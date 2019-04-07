//
//  File.swift
//  Kraze
//
//  Created by Utilisateur on 03/04/2019.
//  Copyright © 2019 Utilisateur. All rights reserved.
//

import Foundation
import UIKit

class MyLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    }
    func initializeLabel() {
        
        
        self.font = UIFont(name: "Halvetica", size: 17)
        self.textColor = UIColor.white
        
    }
}
