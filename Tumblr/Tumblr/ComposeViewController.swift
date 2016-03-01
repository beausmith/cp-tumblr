//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Beau Smith on 2/28/16.
//  Copyright © 2016 Beau Smith. All rights reserved.
//

import UIKit

var fadeTransition: FadeTransition!

class ComposeViewController: UIViewController {

    
    var textButtonOriginalCenter = CGPoint!()
    var photoButtonOriginalCenter = CGPoint!()
    var quoteButtonOriginalCenter = CGPoint!()
    var linkButtonOriginalCenter = CGPoint!()
    var chatButtonOriginalCenter = CGPoint!()
    var videoButtonOriginalCenter = CGPoint!()
    var nevermindButtonOriginalCenter = CGPoint!()
    var hiddenY = CGFloat!()
    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var nevermindButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hiddenY = CGFloat!(700)
        textButtonOriginalCenter = textButton.center
        photoButtonOriginalCenter = photoButton.center
        quoteButtonOriginalCenter = quoteButton.center
        linkButtonOriginalCenter = linkButton.center
        chatButtonOriginalCenter = chatButton.center
        videoButtonOriginalCenter = videoButton.center
        nevermindButtonOriginalCenter = nevermindButton.center
    }
    
    override func viewWillAppear(animated: Bool) {
        textButton.center = CGPoint(x: textButtonOriginalCenter.x,   y: hiddenY)
        photoButton.center = CGPoint(x: photoButtonOriginalCenter.x, y: hiddenY)
        quoteButton.center = CGPoint(x: quoteButtonOriginalCenter.x, y: hiddenY)
        linkButton.center = CGPoint(x: linkButtonOriginalCenter.x,   y: hiddenY)
        chatButton.center = CGPoint(x: chatButtonOriginalCenter.x,   y: hiddenY)
        videoButton.center = CGPoint(x: videoButtonOriginalCenter.x, y: hiddenY)
        nevermindButton.center = CGPoint(x: nevermindButtonOriginalCenter.x, y: hiddenY)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.2, delay: 0, options: [], animations: { () -> Void in
            self.textButton.center = self.textButtonOriginalCenter
            self.quoteButton.center = self.quoteButtonOriginalCenter
            }, completion: nil)
        UIView.animateWithDuration(0.2, delay: 0.1, options: [], animations: { () -> Void in
            self.photoButton.center = self.photoButtonOriginalCenter
            self.videoButton.center = self.videoButtonOriginalCenter
            }, completion: nil)
        UIView.animateWithDuration(0.2, delay: 0.2, options: [], animations: { () -> Void in
            self.linkButton.center = self.linkButtonOriginalCenter
            self.chatButton.center = self.chatButtonOriginalCenter
            self.nevermindButton.center = self.nevermindButtonOriginalCenter
            }, completion: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let destinationViewController = segue.destinationViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTapNevermindButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
