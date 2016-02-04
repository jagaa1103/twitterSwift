//
//  ViewController.swift
//  twitterSwift
//
//  Created by Enkhjargal Gansukh on 2/4/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tweetText: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tweetText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showShareAction(sender: AnyObject) {
        if(self.tweetText .isFirstResponder()){
            self.tweetText.resignFirstResponder()
        }
            if(SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter)){
                print("signed in Twitter!!")
                let tweetComposer = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                if(self.tweetText.text.characters.count < 144){
                    tweetComposer.setInitialText(self.tweetText.text)
                    self.presentViewController(tweetComposer, animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "Alert", message: "Your text is so long. Please type only 144 characters.", preferredStyle: UIAlertControllerStyle.Alert)
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
                    alert.addAction(okAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }else{
                let alert = UIAlertController(title: "Alert", message: "Please sign in twitter", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if (textView.text.characters.count > 144) {
            textView.deleteBackward()
        }
        return true
    }

}

