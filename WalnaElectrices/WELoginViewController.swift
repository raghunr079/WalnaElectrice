//
//  LoginViewController.swift
//  WalnaElectrices
//
//  Created by Prasanta Das on 24/9/16.
//  Copyright © 2016 Nidhi Raghu. All rights reserved.
//

import UIKit
import DLRadioButton

class WELoginViewController: UIViewController {

    
    private var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createViewComponents()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.hidden = false
        
        self.title = "Walna Electrics"
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 006/255, green: 90/255, blue: 154/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationController?.navigationBar.barStyle = .BlackTranslucent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func createViewComponents()
    {
        self.view.backgroundColor = UIColor.whiteColor()
        
        let screen = UIScreen.mainScreen().bounds
        
        
        let segmentedControl = WESegmentedControl.init(
            FrameWithoutIcon: CGRectMake(0, 0, screen.width, 44),
            items: ["LOGIN", "SIGNUP"],
            backgroundColor: UIColor(red: 006/255, green: 90/255, blue: 154/255, alpha: 1.0),
            thumbColor: UIColor.whiteColor(),
            textColor: UIColor.whiteColor(),
            selectedTextColor: UIColor.whiteColor())
        
        segmentedControl.selectedIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(self.segmentAction(_:)), forControlEvents: .ValueChanged)
        self.view.addSubview(segmentedControl)
        
        
        let yPadding = segmentedControl.frame.origin.y + segmentedControl.frame.size.height

        
        self.scrollView = UIScrollView(frame: CGRectMake(0, yPadding, screen.width, screen.height - yPadding))
        
        
        self.view.addSubview(self.scrollView)
        
        createLoginComponents(yPadding, screenWidth: screen.width)


    }
    
    
    func createLoginComponents(y:CGFloat, screenWidth:CGFloat)
    {
        
        let signUpView = getViewWithTag(self.scrollView, tag: 10002) as? UIView
        if(signUpView != nil)
        {
            signUpView!.removeFromSuperview()
        }
        
        
        let loginView = UIView(frame: CGRectMake(0,0,screenWidth,10))
        loginView.tag = 10001
        
        var yPadding = CGFloat(50.0)
        
        let emailTextField = UITextField.init(frame: CGRectMake(20, yPadding, screenWidth - 40, 30))
        emailTextField.placeholder = "Email ID"
        emailTextField.rightViewMode = .Always
        
        let imageView = UIImageView.init(frame: CGRectMake(0, 0, 15, 15))
        imageView.image = UIImage.init(named: "calendar.png")
        emailTextField.rightView = imageView
        
        loginView.addSubview(emailTextField)
        
        yPadding += emailTextField.frame.size.height + 10
        
        let separatorLine = UIView.init(frame: CGRectMake(20, yPadding, screenWidth - 40, 2))
        separatorLine.backgroundColor = UIColor.grayColor()
        
        loginView.addSubview(separatorLine)
        
        yPadding += separatorLine.frame.size.height + 10
        
        
        
        let passwordTextField = UITextField.init(frame: CGRectMake(20, yPadding, screenWidth - 40, 30))
        passwordTextField.placeholder = "Password"
        passwordTextField.rightViewMode = .Always
        
        let imageView1 = UIImageView.init(frame: CGRectMake(0, 0, 15, 15))
        imageView1.image = UIImage.init(named: "calendar.png")
        passwordTextField.rightView = imageView1
        
        loginView.addSubview(passwordTextField)
        
        yPadding += emailTextField.frame.size.height + 10
        
        let separatorLine1 = UIView.init(frame: CGRectMake(20, yPadding, screenWidth - 40, 2))
        separatorLine1.backgroundColor = UIColor.grayColor()
        
        loginView.addSubview(separatorLine1)
        
        yPadding += separatorLine1.frame.size.height + 30
        
        
        
        // create Login button
        let loginButton = WECustomButton(type: .Custom)
        loginButton.frame = CGRect(x: 20, y: yPadding, width: screenWidth - 40, height: 41)
        loginButton.delegate = self
        loginButton.tag = 2002
        
        do {
            try loginButton.setViewMetaData(["buttonId" : "2001", "title" : "Login", "backgroundColor" : UIColor(red: 006/255, green: 90/255, blue: 154/255, alpha: 1.0), "titleFont" : UIFont.boldSystemFontOfSize(14)])
        }
        catch {
            print("Error - ", description)
        }
        
        loginButton.center.x = self.view.frame.size.width / 2
        loginView.addSubview(loginButton)
        
        yPadding += loginButton.frame.size.height + 10

        
        let forgetBtn = UIButton(type: .Custom)
        forgetBtn.backgroundColor = UIColor.clearColor()
        forgetBtn.setTitle("Forgot Password?", forState: UIControlState.Normal)
        forgetBtn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        forgetBtn.frame = CGRectMake(screenWidth - 180, yPadding, 150, 30)
        
        loginView.addSubview(forgetBtn)

        
        yPadding += forgetBtn.frame.size.height + 30
        
        
        let titleLabel = UILabel(frame: CGRect(x: 20, y: yPadding, width: screenWidth - 40, height: 20))
        titleLabel.text = "Or Login With"
        titleLabel.textAlignment = .Left
        titleLabel.font = UIFont.boldSystemFontOfSize(11)
        titleLabel.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1.0)
        loginView.addSubview(titleLabel)
        
        yPadding += titleLabel.frame.size.height + 30

        
        // create Login With google+ button
        let loginWithGoogleBtn = WECustomButton(type: .Custom)
        loginWithGoogleBtn.frame = CGRect(x: 20, y: yPadding, width: screenWidth - 40, height: 38)
        loginWithGoogleBtn.delegate = self
        loginWithGoogleBtn.tag = 401
        
        do {
            try loginWithGoogleBtn.setViewMetaData(["buttonId" : "401", "title" : "Login With Google+", "image" : "googlePlus.png", "backgroundColor" : UIColor.whiteColor(), "titleFont" : UIFont.boldSystemFontOfSize(14), "titleColor" : UIColor.grayColor()])
            loginWithGoogleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0)
        }
        catch _ {
            print("Error - Unknown Error")
        }
        
        loginWithGoogleBtn.layer.borderWidth = 2.0
        loginWithGoogleBtn.layer.borderColor = UIColor.redColor().CGColor
        loginView.addSubview(loginWithGoogleBtn)
        
        yPadding = loginWithGoogleBtn.frame.origin.y + loginWithGoogleBtn.frame.size.height + 30
        
        // create Login With facebook+ button
        let loginWithFaceBookBtn = WECustomButton(type: .Custom)
        loginWithFaceBookBtn.frame = CGRect(x: 20, y: yPadding, width: screenWidth - 40, height: 38)
        loginWithFaceBookBtn.delegate = self
        loginWithFaceBookBtn.tag = 401
        
        do {
            try loginWithFaceBookBtn.setViewMetaData(["buttonId" : "402", "title" : "Login With FaceBook+", "image" : "faceBook.png", "backgroundColor" : UIColor.whiteColor(), "titleFont" : UIFont.boldSystemFontOfSize(14), "titleColor" : UIColor.grayColor()])
            loginWithFaceBookBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0)
        }
        catch _ {
            print("Error - Unknown Error")
        }
        
        loginWithFaceBookBtn.layer.borderWidth = 2.0
        loginWithFaceBookBtn.layer.borderColor = UIColor(red: 006/255, green: 90/255, blue: 154/255, alpha: 1.0).CGColor
        loginView.addSubview(loginWithFaceBookBtn)
        
        yPadding = loginWithFaceBookBtn.frame.origin.y + loginWithFaceBookBtn.frame.size.height + 30
        
        
        
        var rect = loginView.frame
        rect.size.height = yPadding
        loginView.frame = rect
        
        self.scrollView.addSubview(loginView)

        WEViewAnimator.animateView(loginView, withTransform: WEViewAnimator.TransformTilt, andDuration: 1.0)
        

        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, y + yPadding)
    }
    
    
    func createSignUpComponents(y:CGFloat, screenWidth:CGFloat)
    {
        
        let loginView = getViewWithTag(self.scrollView, tag: 10001) as? UIView
        if(loginView != nil)
        {
            loginView!.removeFromSuperview()
        }
        
        let signUpView = UIView(frame: CGRectMake(0,0,screenWidth,10))
        signUpView.tag = 10002
        
        var yPadding = CGFloat(50.0)
        
        
        let firstNameTextField = UITextField.init(frame: CGRectMake(20, yPadding, screenWidth - 40, 30))
        firstNameTextField.placeholder = "First and Second Name"
        
        signUpView.addSubview(firstNameTextField)
        
        yPadding += firstNameTextField.frame.size.height + 10
        
        var separatorLine = UIView.init(frame: CGRectMake(20, yPadding, screenWidth - 40, 2))
        separatorLine.backgroundColor = UIColor.grayColor()
        
        signUpView.addSubview(separatorLine)
        
        yPadding += separatorLine.frame.size.height + 10
        
        let emailTextField = UITextField.init(frame: CGRectMake(20, yPadding, screenWidth - 40, 30))
        emailTextField.placeholder = "Email ID"
        
        signUpView.addSubview(emailTextField)
        
        yPadding += emailTextField.frame.size.height + 10
        
         separatorLine = UIView.init(frame: CGRectMake(20, yPadding, screenWidth - 40, 2))
        separatorLine.backgroundColor = UIColor.grayColor()
        
        signUpView.addSubview(separatorLine)
        
        yPadding += separatorLine.frame.size.height + 10
        
        
        
        let passwordTextField = UITextField.init(frame: CGRectMake(20, yPadding, screenWidth - 40, 30))
        passwordTextField.placeholder = "Password"
        
        signUpView.addSubview(passwordTextField)
        
        yPadding += emailTextField.frame.size.height + 10
        
         separatorLine = UIView.init(frame: CGRectMake(20, yPadding, screenWidth - 40, 2))
        separatorLine.backgroundColor = UIColor.grayColor()
        
        signUpView.addSubview(separatorLine)
        
        yPadding += separatorLine.frame.size.height + 10
        
        let mobileNumberTextField = UITextField.init(frame: CGRectMake(20, yPadding, screenWidth - 40, 30))
        mobileNumberTextField.placeholder = "Mobile Number"
        
        signUpView.addSubview(mobileNumberTextField)
        
        yPadding += mobileNumberTextField.frame.size.height + 10
        
        separatorLine = UIView.init(frame: CGRectMake(20, yPadding, screenWidth - 40, 2))
        separatorLine.backgroundColor = UIColor.grayColor()
        
        signUpView.addSubview(separatorLine)
        
        yPadding += separatorLine.frame.size.height + 30
        
        //other buttons
        var frame = CGRectMake(20, yPadding, screenWidth - 40, 30)
        let maleRadioButton = createRadioButton(frame, title: "Male", color: UIColor(red: 006/255, green: 90/255, blue: 154/255, alpha: 1.0))
        
        signUpView.addSubview(maleRadioButton)

    
        frame = CGRectMake(screenWidth - 250, yPadding, screenWidth - 40, 30)
        let femaleRadioButton = createRadioButton(frame, title: "Female", color: UIColor(red: 006/255, green: 90/255, blue: 154/255, alpha: 1.0))
        

        maleRadioButton.otherButtons = [femaleRadioButton]
        
        signUpView.addSubview(femaleRadioButton)
        

        
        yPadding += 50
        
        
        let checkBox = VKCheckbox(frame: CGRectMake(20,yPadding ,25,25))
        
        // Simple checkbox callback
        checkBox.checkboxValueChangedBlock = {
            isOn in
            print("Basic checkbox is \(isOn ? "ON" : "OFF")")
        }
        
        signUpView.addSubview(checkBox)
        

        
        let termsAndConditionTextView  =  UITextView(frame: CGRectMake(50, yPadding, screenWidth - 100, 50))
        
        let attributedString = NSMutableAttributedString(string:"By selecting this you are agree to terms and conditions offers")
        
        attributedString.setAsLink("terms", linkURL: "http://google.com")
        
        attributedString.setAsLink("conditions offers", linkURL: "http://google.com")
        
        attributedString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue", size: 16.0)!, range: NSRange(location: 0, length: attributedString.string.characters.count))
        
        
        termsAndConditionTextView.attributedText = attributedString
        
        signUpView.addSubview(termsAndConditionTextView)

        
        yPadding += termsAndConditionTextView.frame.size.height + 30

        
        // create Login button
        let signUpButton = WECustomButton(type: .Custom)
        signUpButton.frame = CGRect(x: 20, y: yPadding, width: screenWidth - 40, height: 41)
        signUpButton.delegate = self
        signUpButton.tag = 2002
        
        do {
            try signUpButton.setViewMetaData(["buttonId" : "2002", "title" : "Sign Up", "backgroundColor" : UIColor(red: 006/255, green: 90/255, blue: 154/255, alpha: 1.0), "titleFont" : UIFont.boldSystemFontOfSize(14)])
        }
        catch {
            print("Error - ", description)
        }
        
        signUpButton.center.x = self.view.frame.size.width / 2
        signUpView.addSubview(signUpButton)
        
        yPadding += signUpButton.frame.size.height + 50
      
        
        let titleLabel = UILabel(frame: CGRect(x: 20, y: yPadding, width: screenWidth - 40, height: 20))
        titleLabel.text = "Or Login With"
        titleLabel.textAlignment = .Left
        titleLabel.font = UIFont.boldSystemFontOfSize(11)
        titleLabel.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1.0)
        signUpView.addSubview(titleLabel)
        
        yPadding += titleLabel.frame.size.height + 30
        
        
        // create Login With google+ button
        let loginWithGoogleBtn = WECustomButton(type: .Custom)
        loginWithGoogleBtn.frame = CGRect(x: 20, y: yPadding, width: screenWidth - 40, height: 38)
        loginWithGoogleBtn.delegate = self
        loginWithGoogleBtn.tag = 401
        
        do {
            try loginWithGoogleBtn.setViewMetaData(["buttonId" : "401", "title" : "Login With Google+", "image" : "googlePlus.png", "backgroundColor" : UIColor.whiteColor(), "titleFont" : UIFont.boldSystemFontOfSize(14), "titleColor" : UIColor.grayColor()])
            loginWithGoogleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0)
        }
        catch _ {
            print("Error - Unknown Error")
        }
        
        loginWithGoogleBtn.layer.borderWidth = 2.0
        loginWithGoogleBtn.layer.borderColor = UIColor.redColor().CGColor
        signUpView.addSubview(loginWithGoogleBtn)
        
        yPadding = loginWithGoogleBtn.frame.origin.y + loginWithGoogleBtn.frame.size.height + 30
        
        // create Login With facebook+ button
        let loginWithFaceBookBtn = WECustomButton(type: .Custom)
        loginWithFaceBookBtn.frame = CGRect(x: 20, y: yPadding, width: screenWidth - 40, height: 38)
        loginWithFaceBookBtn.delegate = self
        loginWithFaceBookBtn.tag = 401
        
        do {
            try loginWithFaceBookBtn.setViewMetaData(["buttonId" : "402", "title" : "Login With faceBook", "image" : "faceBook.png", "backgroundColor" : UIColor.whiteColor(), "titleFont" : UIFont.boldSystemFontOfSize(14), "titleColor" : UIColor.grayColor()])
            loginWithFaceBookBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0)
        }
        catch _ {
            print("Error - Unknown Error")
        }
        
        loginWithFaceBookBtn.layer.borderWidth = 2.0
        loginWithFaceBookBtn.layer.borderColor = UIColor(red: 006/255, green: 90/255, blue: 154/255, alpha: 1.0).CGColor
        signUpView.addSubview(loginWithFaceBookBtn)
        
        yPadding = loginWithFaceBookBtn.frame.origin.y + loginWithFaceBookBtn.frame.size.height + 30
        
        
        
        var rect = signUpView.frame
        rect.size.height = yPadding
        signUpView.frame = rect
        
        self.scrollView.addSubview(signUpView)
        
        WEViewAnimator.animateView(signUpView, withTransform: WEViewAnimator.TransformTilt, andDuration: 1.0)
        
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, y + yPadding)
    }

    // MARK: Helper
    
    private func createRadioButton(frame : CGRect, title : String, color : UIColor) -> DLRadioButton {
        let radioButton = DLRadioButton(frame: frame)
        radioButton.titleLabel!.font = UIFont.systemFontOfSize(16)
        radioButton.setTitle(title, forState: UIControlState.Normal)
        radioButton.setTitleColor(color, forState: UIControlState.Normal)
        radioButton.iconColor = color
        radioButton.iconSize = 16
        radioButton.indicatorColor = color
        radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        radioButton.addTarget(self, action: #selector(WELoginViewController.logSelectedButton), forControlEvents: UIControlEvents.TouchUpInside)
        
        return radioButton
    }
    
    @objc @IBAction private func logSelectedButton(radioButton : DLRadioButton) {
        if (radioButton.multipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected.\n", button.titleLabel!.text!));
            }
        } else {
            print(String(format: "%@ is selected.\n", radioButton.selectedButton()!.titleLabel!.text!));
        }
    }
    
    func segmentAction(sender: WESegmentedControl){
        print("sender: \(sender.selectedIndex)")
        
        let ypadding = self.scrollView.frame.origin.y

        switch sender.selectedIndex {
            
        case 0:
            
            let screen = UIScreen.mainScreen().bounds

            
            createLoginComponents(ypadding, screenWidth: screen.width)

            break
            
        case 1:
            
            let screen = UIScreen.mainScreen().bounds
            
            createSignUpComponents(ypadding, screenWidth: screen.width)
            break
            
        default:
            break
        }
    }
    
    
    func getViewWithTag(view : UIView, tag : Int) -> AnyObject? {
        
        let newArray = view.subviews
        for newView in newArray {
            
            if (newView.tag == tag) {
                
                return newView
            }
        }
        
        return nil
    }
    
    
    
}

extension NSMutableAttributedString {
    
    public func setAsLink(textToFind:String, linkURL:String) -> Bool {
        
        let foundRange = self.mutableString.rangeOfString(textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(NSLinkAttributeName, value: linkURL, range: foundRange)
            return true
        }
        return false
    }
}

// MARK: Custom Button delegate
extension WELoginViewController : WECustomButtonDelegate {
    
    func customButtonClickEventHandler(sender : WECustomButton, buttonId : String) {
        
        if (buttonId == "2001") { // Login Button
            
            let landingVC = WELandingPageVC(nibName: nil, bundle: nil)
            
            self.navigationController?.pushViewController(landingVC, animated: true)
        }
        else if (buttonId == "2002") { // Sign Up Button
            
            
        }
    }
}

