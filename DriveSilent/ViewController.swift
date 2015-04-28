//
//  ViewController.swift
//  DriveSilent
//
//  Created by Pradnya Nikam on 27/04/15.
//  Copyright (c) 2015 Prad. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    let motionActivityManager = CMMotionActivityManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        if CMMotionActivityManager.isActivityAvailable(){
            println("Activity Available")
            motionActivityManager.startActivityUpdatesToQueue(NSOperationQueue()){
                (activity: CMMotionActivity!) -> Void in
                    if activity.walking {
                        println("MotionTypeWalking")
                    } else if activity.running {
                        println("MotionTypeRunning")
                    } else if activity.automotive {
                        println("MotionTypeDriving")
                    } else if activity.stationary || activity.unknown {
                        println("MotionTypeNotMoving")
                    }
                
            }
            
        }else{
            println("Activity not Available")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

