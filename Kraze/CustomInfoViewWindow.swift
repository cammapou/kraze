//
//  CustomInfoViewWindow.swift
//  Kraze
//
//  Created by Utilisateur on 03/04/2019.
//  Copyright © 2019 Utilisateur. All rights reserved.
//

import UIKit

protocol MapMarkerDelegate: class {
    func didTapInfoButton(data: NSDictionary)
}

class CustomInfoViewWindow: UIView {

    @IBOutlet weak var nameEvent: UILabel!
    @IBOutlet weak var nameClub: UILabel!
    @IBOutlet weak var horaireEvent: UILabel!
    @IBOutlet weak var tagType: UILabel!
    @IBOutlet weak var nameSold: UILabel!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "MapInfoWindowView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
    }
}
