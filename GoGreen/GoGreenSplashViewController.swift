//
//  GoGreenSplashViewController.swift
//  GoGreen
//
//  Created by Raquel Hernandez on 6/2/15.
//  Copyright (c) 2015 Raquel Hernandez. All rights reserved.
//

import UIKit
import VENTouchLock

class GoGreenSplashViewController: VENTouchLockSplashViewController {
    @IBOutlet weak var passCode: UIButton!
    @IBOutlet weak var touchButton: UIButton!
    
    func viewDidAppear() {
        super.viewDidAppear(true)
        if(!VENTouchLock.shouldUseTouchID()){
            touchButton.hidden = false
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userTappedShowTouchId(sender: UIButton) {
        self.showTouchID();
    }
    
    @IBAction func userTappedEnterPasscode(sender: UIButton) {
        self.showPasscodeAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
