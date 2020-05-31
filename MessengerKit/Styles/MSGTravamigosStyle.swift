//
//  MSGTravamigosStyle.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

/// Styles the messenger view to be similar to that used in Travamigos.
public struct MSGTravamigosStyle: MSGMessengerStyle {
    
    public var collectionView: MSGCollectionView.Type = MSGTravCollectionView.self
    
    public var inputView: MSGInputView.Type = MSGTravInputView.self
    
    public var headerHeight: CGFloat = 12
    
    public var footerHeight: CGFloat = 30
    
    public var backgroundColor: UIColor = .groupTableViewBackground
    
    public var inputViewBackgroundColor: UIColor = .white
    
    public var font: UIFont = .systemFont(ofSize: 14, weight: .semibold)
    
    public var inputFont: UIFont = .systemFont(ofSize: 14, weight: .semibold)
    
    public var inputPlaceholder: String = "Type something..."
    
    public var inputTextColor: UIColor = .darkGray
    
    public var inputPlaceholderTextColor: UIColor = .lightGray
    
    public var outgoingTextColor: UIColor = .darkGray
    
    public var incomingTextColor: UIColor = .white
    
    public var outgoingLinkColor: UIColor = #colorLiteral(red: 0.5, green: 0.3566596533, blue: 1, alpha: 1)
    
    public var incomingLinkColor: UIColor = #colorLiteral(red: 0.5, green: 0.3566596533, blue: 1, alpha: 1) //UIColor(red:1.00, green:0.30, blue:0.13, alpha:1.00)
    
    public func size(for message: MSGMessage, in collectionView: UICollectionView) -> CGSize {
        
        var size: CGSize!
        
        switch message.body {
        case .text(let body):
            
            let bubble = MSGTravOutgoingBubble()
//            let color = message.user.isSender ? outgoingTextColor :  incomingTextColor
//            bubble.attributer = bubble.text!.size(14)
//            .color(color)
//            .match("is").underline.underline(UIColor.red)
//            .makeInteract { link in
//                    print(link)
//                }
//            .all.font(UIFont.systemFont(ofSize: 14, weight: .semibold))
        
            bubble.text = body
            bubble.font = font
            let bubbleSize = bubble.calculatedSize(in: CGSize(width: collectionView.bounds.width, height: .infinity))
            size = CGSize(width: collectionView.bounds.width, height: bubbleSize.height)
            
            break
            
            
        case .emoji:
            
            size = CGSize(width: collectionView.bounds.width, height: 60)
            
            break
            
        default:
            
            size = CGSize(width: collectionView.bounds.width, height: 175)
            
            break
        }
        
        return size
        
    }
    
    // MARK: - Custom Properties
    
    /// Colors for the gradient on outgoing bubbles
    public var outgoingGradient: [CGColor] = [
            #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1).cgColor,
            #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.9294117647, alpha: 1).cgColor,
        ]
        
    
    /// Colors for the gradient on incoming bubbles
    public var incomingGradient: [CGColor] = [
            UIColor.black.cgColor,
            #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1).cgColor
        ]
    
    /// The text for the send button
    public var inputButtonText = "Send"
    
}
