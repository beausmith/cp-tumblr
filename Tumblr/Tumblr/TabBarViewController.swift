//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Beau Smith on 2/28/16.
//  Copyright © 2016 Beau Smith. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!

    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var exploreBubbleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        exploreBubbleImageView.alpha = 0
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        viewControllers = [
            homeViewController,
            searchViewController,
            accountViewController,
            trendingViewController
        ]

        buttons[selectedIndex].selected = true
        didTapTab(buttons[selectedIndex])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTapTab(sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].selected = false
        
        let previousVC = viewControllers[previousIndex]
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.selected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        vc.didMoveToParentViewController(self)
        
        if selectedIndex != 1 {
            exploreBubbleImageView.alpha = 1
        } else {
            exploreBubbleImageView.alpha = 0
        }
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
