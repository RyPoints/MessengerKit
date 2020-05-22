//
//  MSGTravIncomingBubble.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class MSGTravIncomingBubble: MSGTravOutgoingBubble {
    
    override var gradientColors: [CGColor] {
        return [
                #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
                #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1).cgColor
        ]
    }
    
    override var tintColor: UIColor! {
        get {
            return .blue
        }
        set { }
    }
    
    
    
}
