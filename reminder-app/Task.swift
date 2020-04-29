//
//  Task.swift
//  reminder-app
//
//  Created by Beverly May Castillo on 4/29/20.
//  Copyright © 2020 Beverly May Castillo. All rights reserved.
//

import Foundation

enum TaskType {
    case daily, weekly, monthly
    
}

struct Task {
    var name: String
    var type: TaskType
    var completed: Bool
    var lastCompleted: NSDate?
}
