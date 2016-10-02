//
//  WECustomButton.swift
//
//
//  Created by  Raghu on 24/9/16.
//  Copyright © 2016 Raghu Nidhi All rights reserved.
//

import UIKit

@objc public protocol WECustomButtonDelegate: class {
    
    func customButtonClickEventHandler(sender : WECustomButton, buttonId : String)
}

/// This class is inherited from UIButton and will give custom button.

public class WECustomButton: UIButton {
    
    /// Set delegate to view to receive click event
    weak var delegate : WECustomButtonDelegate?
    
    private var buttonId : String?
    private var enabledBackground : UIColor?
    private var disabledBackground : UIColor?
    
    override public init (frame : CGRect) {
        super.init(frame : frame)
    }

    convenience init () {
        self.init(frame:CGRect.zero)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    deinit {
        
        print("CustomButton deallocated")
    }

    public func setViewMetaData(metaData : Dictionary<String, AnyObject>? = nil) throws {
        
        
        if (metaData != nil) {
            
            if (metaData!["buttonId"] != nil) {
                
                self.buttonId = metaData!["buttonId"] as? String
            }
            
            if (metaData!["title"] != nil) {
                
                let titleValue = metaData!["title"] as? String
                self.setTitle(titleValue, forState: .Normal)
            }
            
            if (metaData!["disabledtitleColor"] != nil) {
                
                let titleColor = metaData!["disabledtitleColor"] as? UIColor
                self.setTitleColor(titleColor! ,forState: .Disabled)
            }
            else {
                self.setTitleColor(UIColor(red: 255/255, green: 204/255, blue: 204/255, alpha: 1.0) ,forState: .Disabled)
            }
            
            if (metaData!["titleColor"] != nil) {
                
                let titleColor = metaData!["titleColor"] as? UIColor
                self.setTitleColor(titleColor! ,forState: .Normal)
            }
            else {
                self.setTitleColor(UIColor.whiteColor() ,forState: .Normal)
            }
            
            if (metaData!["titleFont"] != nil) {

                let titleFont = metaData!["titleFont"] as? UIFont
                self.titleLabel?.font = titleFont
            }
            else {
                
                self.titleLabel?.font = UIFont.boldSystemFontOfSize(14)
            }
            
            if (metaData!["image"] != nil) {
                
                let imageValue = metaData!["image"] as? String
                self.setImage(UIImage(named: imageValue!), forState: .Normal)
            }
            
            if (metaData!["disableBackgroundColor"] != nil) {
                
                self.backgroundColor = metaData!["disableBackgroundColor"] as? UIColor
                self.disabledBackground = self.backgroundColor
            }
            else {
                self.backgroundColor = UIColor.blueColor()
                self.disabledBackground = self.backgroundColor
            }
            
            if (metaData!["backgroundColor"] != nil) {
                
                self.backgroundColor = metaData!["backgroundColor"] as? UIColor
                self.enabledBackground = self.backgroundColor
            }
            else {
                self.backgroundColor = UIColor.blueColor()
                self.enabledBackground = self.backgroundColor
            }
            
            if (metaData!["backgroundImage"] != nil) {
                
                self.setBackgroundImage(UIImage(named: (metaData!["backgroundImage"] as? String)!), forState: .Normal)
            }
            
            if (metaData!["cornerRadius"] != nil) {
                
                self.layer.cornerRadius = 5.0
            }
            
            if (metaData!["hidden"] != nil) {
                let hiddenValue = metaData!["hidden"] as? String
                if (hiddenValue == "0") {
                    self.hidden = false
                }
                else {
                    self.hidden = true
                }
            }
            
            initViewLayout(self.frame.size)
        }
    }
    
    public func setBKValue(value : Dictionary<String, AnyObject>? = nil, key : String? = nil) throws {
        
        
        if (key?.rangeOfString("button") != nil) {
            
            if let isEnabled = value!["enable"] as? String {
                
                switch isEnabled {
                case "1":
                    self.backgroundColor = self.enabledBackground
                    self.enabled = true
                    break
                case "0":
                    self.backgroundColor = self.disabledBackground
                    self.enabled = false
                    break
                default:
                    break
                }
            }
        }
    }
    
    //MARK: Private methods
    
    private func initViewLayout(preferredSize : CGSize) {
        
        self.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0)
        self.addTarget(self, action: #selector(self.buttonClickEvent(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    @objc private func buttonClickEvent(sender : UIButton? = nil) {
        
        delegate?.customButtonClickEventHandler(self, buttonId: buttonId!)
    }
}
