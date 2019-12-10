//
//  ViewController.swift
//  SideMenuUsingStoryboard
//
//  Created by Julio Collado on 12/10/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let transition = SlideInTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        var menutableViewController: UIViewController?
        if #available(iOS 13.0, *) {
            menutableViewController = storyBoard.instantiateViewController(identifier: "MenuTableViewController")
            menutableViewController?.modalPresentationStyle = .fullScreen
        } else {
            menutableViewController = storyBoard.instantiateViewController(withIdentifier: "MenuTableViewController")
        }
        menutableViewController?.modalPresentationStyle = .overCurrentContext
        menutableViewController?.transitioningDelegate = self
        present(menutableViewController!, animated: true)
    }
    
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

