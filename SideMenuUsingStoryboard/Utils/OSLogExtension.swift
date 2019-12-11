//
//  OSLogExtension.swift
//  SideMenuUsingStoryboard
//
//  Created by Julio Collado on 12/11/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation
import os.log

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier!

    /// Logs the view cycles.
    static let viewCycle = OSLog(subsystem: subsystem, category: "View Cycle")
    static let userAction = OSLog(subsystem: subsystem, category: "User Action")
}
