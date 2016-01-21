//
//  AddGoalVC.swift
//  MotivatingGoals
//
//  Created by Heidi Yee on 1/20/16.
//  Copyright © 2016 Heidi Yee. All rights reserved.
//

import UIKit
import Parse

class AddGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberPerWeekTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.numberPerWeekTextField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveToParseButton(sender: AnyObject) {
        guard let nameText = self.nameTextField.text else {return}
        guard let numberPerWeek = self.numberPerWeekTextField.text else {return}
        guard let numberPerWEekInt = Int(numberPerWeek) else {return}
        
        guard let currentUsername = PFUser.currentUser()?.username else {return}
        let goal = Goal(goalName: nameText, howManytimesPerWeek: numberPerWEekInt)
        goal.user = currentUsername
        
        ParseService.uploadObjectToGoalClass(goal) { (success, error) -> Void in
            if error == nil {
                print("saved")
            }
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}
