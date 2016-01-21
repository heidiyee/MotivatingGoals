//
//  ParseService.swift
//  MotivatingGoals
//
//  Created by Heidi Yee on 1/20/16.
//  Copyright © 2016 Heidi Yee. All rights reserved.
//

import UIKit
import Parse

class ParseService {
    
    class func uploadObjectToGoalClass(object: Goal, completion: (success: Bool, error: NSError?) -> Void ){
        
        let status = PFObject(className: "Goals")
        status["name"] = object.goalName
        status["timesPerWeek"] = object.howManyTimesPerWeek
        status["timesCompleted"] = 0
        status["user"] = object.user
        status.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
            completion(success: success, error: error)
        }
    }
    
    class func getParseData(className: String, user: String, completion: (array: [PFObject]?, error: NSError?) -> Void) {
        
        let parseQuery = PFQuery(className: "Goals")
        parseQuery.whereKey("user", equalTo: user)
        parseQuery.findObjectsInBackgroundWithBlock { (parseObjects, error) -> Void in
            if let parseObjects = parseObjects {
                completion(array: parseObjects,error: nil)
            }
        }
        
    }
}
