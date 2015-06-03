//
//  ViewController.swift
//  GoGreen
//
//  Created by Raquel Hernandez on 6/2/15.
//  Copyright (c) 2015 Raquel Hernandez. All rights reserved.
//

import UIKit
import VENTouchLock

class ViewController: UIViewController {

    @IBOutlet weak var TouchIDSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.configureTouchIDToggle()
    }
    
    func configureTouchIDToggle(){
        self.TouchIDSwitch.enabled = VENTouchLock.sharedInstance().isPasscodeSet() && VENTouchLock.canUseTouchID()
        self.TouchIDSwitch.on = VENTouchLock.shouldUseTouchID()
    }
    
    
    @IBAction func userTappedSetPasscode(sender: UIButton) {
        if(VENTouchLock.sharedInstance().isPasscodeSet()){
            NSLog(" Passcode already exist, we should show an alert view here")
        }else{
            let createPasscodeVC = VENTouchLockCreatePasscodeViewController()
            self.presentViewController(createPasscodeVC, animated: true, completion: { () -> Void in
                println("Setting passcode")
            })
        }
    }
    
    @IBAction func userTappedShowPasscode(sender: UIButton) {
        if(VENTouchLock.sharedInstance().isPasscodeSet()){
            let showPasscodeVC = VENTouchLockEnterPasscodeViewController()
            self.presentViewController(showPasscodeVC, animated: true, completion: { () -> Void in
                println("showing passcode")
            })
        }else{
            println("No passcode, please set a passcode first")
        }
    }
    
     @IBAction func userTappedDeletePasscode(sender: UIButton) {
        if(VENTouchLock.sharedInstance().isPasscodeSet()){
            VENTouchLock.sharedInstance().deletePasscode()
            //self.configureTouchIDToggle
        }else{
            println("No passcode")
        }
     }
    
    @IBAction func userTappedSwitch(sender: UISwitch) {
        VENTouchLock.setShouldUseTouchID(true)
    }


}

