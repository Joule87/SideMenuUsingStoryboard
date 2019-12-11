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
    var topView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        (menutableViewController as! MenuTableViewController).didTapMenuType = transitionToViewController
        menutableViewController?.modalPresentationStyle = .overCurrentContext
        menutableViewController?.transitioningDelegate = self
        present(menutableViewController!, animated: true)
    }
    
    func transitionToViewController(_ menuOption: SideMenuOptions) {
        
        self.title = menuOption.description.capitalized
        topView?.removeFromSuperview()
        let selectedOptionView = UIView()
        switch menuOption {
        case .Home:
            selectedOptionView.backgroundColor = .clear
        case .Profile:
            selectedOptionView.backgroundColor = .purple
        case .Notifications:
            selectedOptionView.backgroundColor = .magenta
        case .Settings:
            selectedOptionView.backgroundColor = .orange
        case .Gallery:
            selectedOptionView.backgroundColor = .lightGray
            
        }
        selectedOptionView.frame = self.view.bounds
        self.view.addSubview(selectedOptionView)
        topView = selectedOptionView
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

