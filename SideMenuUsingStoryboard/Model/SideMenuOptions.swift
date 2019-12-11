//
//  SideMenuOptions.swift
//  SideMenuUsingStoryboard
//
//  Created by Julio Collado on 12/10/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

enum SideMenuOptions: Int, CaseIterable {
    case Home, Profile, Notifications, Settings, Gallery
    
    var description: String {
        switch self {
        case .Home:
            return "Home"
        case .Profile:
            return "Profile"
        case .Notifications:
            return "Notifications"
        case .Settings:
            return "Settings"
        case .Gallery:
            return "Gallery"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Home:
            return #imageLiteral(resourceName: "home")
        case .Profile:
            return #imageLiteral(resourceName: "Profile")
        case .Notifications:
            return #imageLiteral(resourceName: "notification")
        case .Settings:
            return #imageLiteral(resourceName: "settings")
        case .Gallery:
            return #imageLiteral(resourceName: "gallery")
        }
    }
}
