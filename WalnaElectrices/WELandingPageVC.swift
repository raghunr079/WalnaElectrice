//
//  WELandingPageVC.swift
//  WalnaElectrices
//
//  Created by Prasanta Das on 25/9/16.
//  Copyright © 2016 Nidhi Raghu. All rights reserved.
//

import UIKit

class WELandingPageVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createViewComponents()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let menuBtn = UIBarButtonItem(image: UIImage(named: "menu.png"), style: .Plain, target: self, action: #selector(menuBtnClicked))
        
        let menuIconBtn = UIBarButtonItem(image: UIImage(named: "barIcon.png"), style: .Plain, target: self, action: #selector(menuBtnClicked))
        
        self.navigationController?.navigationBar.hidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItems = [menuBtn,menuIconBtn]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createViewComponents()
    {
        
    }
    
    
    func menuBtnClicked()
    {
        
    }
}
