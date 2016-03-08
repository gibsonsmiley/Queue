//
//  AddViewController.swift
//  Queue
//
//  Created by Taylor Mott on 3/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CloudKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var studentNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitQuestionButtonTapped() {
        let record = CKRecord(recordType: "Question")
        
        record.setObject(questionTextField.text ?? "", forKey: "body")
        record["studentName"] = studentNameTextField.text ?? ""
        record["wasAnswered"] = NSNumber(bool: false)
        /// ^^^ These are basically the same thing ^^^ ///
        
        let container = CKContainer.defaultContainer()
        container.publicCloudDatabase.saveRecord(record) { (recordSaved, error) -> Void in
            if error == nil {
                //succeeded
                print("record saved: \(record)")
            } else {
                //we have an error
                //awesome error handling goes here
                print("\(error?.localizedDescription)")
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
