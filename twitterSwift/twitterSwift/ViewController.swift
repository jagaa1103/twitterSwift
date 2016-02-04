//
//  ViewController.swift
//  twitterSwift
//
//  Created by Enkhjargal Gansukh on 2/4/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    @IBOutlet weak var tweetText: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showShareAction(sender: AnyObject) {
        if(self.tweetText .isFirstResponder()){
            self.tweetText.resignFirstResponder()
        }
        let actionController: UIAlertController = UIAlertController(title: "Test", message: "Tweet Note", preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        let sendAction = UIAlertAction(title: "Send", style: UIAlertActionStyle.Default, handler: {
            Void in
            print("Send Clicked")
            if(SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter)){
                print("signed in Twitter!!")
            }else{
                let alert = UIAlertController(title: "Alert", message: "Please sign in twitter", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        })
        actionController.addAction(cancelAction)
        actionController.addAction(sendAction)
        self.presentViewController(actionController, animated: true, completion: nil)
        
        
    }

}

