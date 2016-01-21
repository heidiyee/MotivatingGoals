//
//  Goal.swift
//  MotivatingGoals
//
//  Created by Heidi Yee on 1/20/16.
//  Copyright © 2016 Heidi Yee. All rights reserved.
//

import UIKit
import Parse

class Goal {
    
    var goalName: String!
    var numberTimesCompleted: Int = 0
    var howManyTimesPerWeek: Int!
    var user: String?
    
    init(goalName: String, howManytimesPerWeek: Int) {
        self.goalName = goalName
        self.howManyTimesPerWeek = howManytimesPerWeek
    }
    
}
