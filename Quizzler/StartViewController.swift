//
//  StartViewController.swift
//  Quizzler
//
//  Created by Steven Watson on 8/7/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit
import FirebaseDatabase


var code = ""
class StartViewController: UIViewController {
    
    
    
    @IBOutlet weak var codeTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
 
// let dictionary = ["question": "test", "answer": true ] as [String : Any]
// Database.database().reference().child("Quiz").child(code).childByAutoId().setValue(dictionary)
//
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createQuiz(_ sender: Any) {
        
        if codeTextField.text == "" {
            
            print("code was not entered")
            
        
        } else {
            
            
            code = codeTextField.text!
            
        
            
                self.performSegue(withIdentifier: "Go1", sender: nil)
        }
        
        
        
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Go1" {
            
         print(code)
                
            }
            
        }
        
    
    
    
    
    

}
