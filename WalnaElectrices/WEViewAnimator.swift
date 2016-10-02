//
//  CellAnimator.swift
//  CellAnimator
//
//  Created by William Archimede on 29/08/2014.
//  Copyright (c) 2014 HoodBrains. All rights reserved.
//

import UIKit
import QuartzCore

/**
 IWBKCellAnimator used to create a different types of animation transitions
 */

public class WEViewAnimator {
    
    /**
     TransformTipIn used to create a tipIn 3D transform
     
     - returns: CATransform3D object
     */
    
    public static let TransformTipIn = { (layer: CALayer) -> CATransform3D in
        let rotationDegrees: CGFloat = -15.0
        let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
        let offset = CGPoint(x: -20, y: -20)
        var transform = CATransform3DIdentity
        transform = CATransform3DRotate(transform, rotationRadians, 0.0, 0.0, 1.0)
        transform = CATransform3DTranslate(transform, offset.x, offset.y, 0.0)
        
        return transform
    }
    
    /**
     TransformCurl used to create a curl 3D transform
     
     - returns: CATransform3D object
     */

    public static let TransformCurl = { (layer: CALayer) -> CATransform3D in
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -500
        transform = CATransform3DTranslate(transform, -layer.bounds.size.width/2.0, 0.0, 0.0)
        transform = CATransform3DRotate(transform, CGFloat(M_PI)/2.0, 0.0, 1.0, 0.0)
        transform = CATransform3DTranslate(transform, layer.bounds.size.width/2.0, 0.0, 0.0)
        
        return transform
    }
    
    
    /**
     TransformFan used to create a fan 3D transform
     
     - returns: CATransform3D object
     */
    
    public static let TransformFan = { (layer: CALayer) -> CATransform3D in
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, -layer.bounds.size.width/2.0, 0.0, 0.0)
        transform = CATransform3DRotate(transform, -CGFloat(M_PI)/2.0, 0.0, 0.0, 1.0)
        transform = CATransform3DTranslate(transform, layer.bounds.size.width/2.0, 0.0, 0.0)
        return transform
    }
    
    /**
     TransformFlip used to create a flip 3D transform
     
     - returns: CATransform3D object
     */
    public static let TransformFlip = { (layer: CALayer) -> CATransform3D in
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0.0, layer.bounds.size.height/2.0, 0.0)
        transform = CATransform3DRotate(transform, CGFloat(M_PI)/2.0, 1.0, 0.0, 0.0)
        transform = CATransform3DTranslate(transform, 0.0, layer.bounds.size.height/2.0, 0.0)
        return transform
    }
    
    /**
     TransformHelix used to create a Helix 3D transform
     
     - returns: CATransform3D object
     */
    public static let TransformHelix = { (layer: CALayer) -> CATransform3D in
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0.0, layer.bounds.size.height/2.0, 0.0)
        transform = CATransform3DRotate(transform, CGFloat(M_PI), 0.0, 1.0, 0.0)
        transform = CATransform3DTranslate(transform, 0.0, -layer.bounds.size.height/2.0, 0.0)
        return transform
    }
    
    /**
     TransformTilt used to create a Tilt 3D transform
     
     - returns: CATransform3D object
     */
    public static let TransformTilt = { (layer: CALayer) -> CATransform3D in
        var transform = CATransform3DIdentity
        transform = CATransform3DScale(transform, 0.8, 0.8, 0.8)
        return transform
    }
    
    /**
     TransformWave used to create a wave 3D transform
     
     - returns: CATransform3D object
     */
    public static let TransformWave = { (layer: CALayer) -> CATransform3D in
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, -layer.bounds.size.width/2.0, 0.0, 0.0)
        return transform
    }
    
    
    /**
     TransformTipInCard used to create a TipInCard 3D transform
     
     - returns: CATransform3D object
     */
    public static let TransformTipInCard = { (layer: CALayer) -> CATransform3D in
        let rotationDegrees: CGFloat = -15.0
        let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
        let offset = CGPointMake(-20, -20)
        var startTransform = CATransform3DIdentity
        startTransform = CATransform3DRotate(CATransform3DIdentity,
                                             rotationRadians, 0.0, 0.0, 1.0)
        startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0)
        
        return startTransform
    }
    
    /**
     This fuction is to create a animation for the provided cell
     - parameter cell: cell of an table needs to animate
     - parameter transform: 3D transition
     - parameter duration: duration for animation to complete 
     
     */
    
    public class func animateCell(cell: UITableViewCell, withTransform transform: (CALayer) -> CATransform3D, andDuration duration: NSTimeInterval) {
        
        let view = cell.contentView    
        view.layer.transform = transform(cell.layer)
        view.layer.opacity = 0.8
            
        UIView.animateWithDuration(duration) {
            view.layer.transform = CATransform3DIdentity
            view.layer.opacity = 1
        }
    }
    
    /**
     This fuction is to create a animation for the provided cell
     - parameter cell: cell of an table needs to animate
     - parameter transform: 3D transition
     - parameter duration: duration for animation to complete
     
     */
    
    public class func animateView(view: UIView, withTransform transform: (CALayer) -> CATransform3D, andDuration duration: NSTimeInterval) {
        
        let view = view
        view.layer.transform = transform(view.layer)
        view.layer.opacity = 0.8
        
        UIView.animateWithDuration(duration) {
            view.layer.transform = CATransform3DIdentity
            view.layer.opacity = 1
        }
    }
}
