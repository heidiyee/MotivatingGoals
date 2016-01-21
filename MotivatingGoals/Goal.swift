//
//  Goal.swift
//  MotivatingGoals
//
//  Created by Heidi Yee on 1/20/16.
//  Copyright © 2016 Heidi Yee. All rights reserved.
//

import UIKit

class Goal {
    
    var goalName: String
    var numberTimesCompleted: Int
    var howManyTimesPerWeek: Int
    
    init(goalName: String, howManyTimesPerWeek: Int) {
        self.goalName = goalName
        self.numberTimesCompleted = 0
        self.howManyTimesPerWeek = howManyTimesPerWeek
    }

}
