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
        self.presentViewController(actionController, animated: true, completion: nil)
        
        
    }

}

