//
//  MSGTextCollectionViewCell.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGTravCollectionViewCell: MSGMessageCell {
    
    @IBOutlet weak var bubbleWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bubble: MSGTravOutgoingBubble!
    
    override open var message: MSGMessage? {
        didSet {
            guard let message = message,
                case let MSGMessageBody.text(body) = message.body else { return }
            
            bubble.text = body
        }
    }
    
    override open var style: MSGMessengerStyle? {
        didSet {
            guard let message = message, let style = style as? MSGTravamigosStyle else { return }
            bubble.linkTextAttributes[NSAttributedStringKey.underlineColor.rawValue] = style.outgoingLinkColor
            bubble.linkTextAttributes[NSAttributedStringKey.foregroundColor.rawValue] = style.outgoingLinkColor
            let color = message.user.isSender ? style.outgoingTextColor :  style.incomingTextColor
            bubble.attributer = bubble.text!.size(14)
            .color(color)
            .match("is").underline.underline(UIColor.red)
            .makeInteract { link in
                    print(link)
                }
            .all.font(UIFont.systemFont(ofSize: 14, weight: .semibold))
            
            bubble.font = style.font
            //bubble.textColor = message.user.isSender ? style.outgoingTextColor : style.incomingTextColor
            bubble.gradientLayer.colors = message.user.isSender ? style.outgoingGradient : style.incomingGradient
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        let bubbleSize = bubble.calculatedSize(in: bounds.size)
        bubbleWidthConstraint.constant = bubbleSize.width
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        bubble.delegate = self
    }
    
}

extension MSGTravCollectionViewCell: UITextViewDelegate {
    
    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        delegate?.cellLinkTapped(url: URL)
        
        return false
    }
    
}
