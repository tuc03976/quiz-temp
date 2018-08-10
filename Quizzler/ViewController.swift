//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import Gifu




class ViewController: UIViewController {
    
    var firstImageView = GIFImageView()
    
    
    //The UI Elements from the storyboard   are already linked up for you.
    @IBOutlet weak var questionLabel: UILabel?
    @IBOutlet weak var scoreLabel: UILabel?
    @IBOutlet var progressBar: UIView?
    @IBOutlet weak var progressLabel: UILabel?
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    var yourScore : [Int] = []
    var scoreKey : [String] = []
    var username: String = "Steven"
    var uid = "12345"
    
    var interger: [Int] = []
    var names: [String] = []
    
    
    // This gets called when the UIViewController is loaded into memory when the app starts
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        updateUI()
        
        
        
        
      //  signUp()
        
        
        
        
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
print(allQuestions.list)
        
    }

    // Nothing to modify here. This gets called when the system is low on memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //This action gets called when either the true or false button is pressed.
    @IBAction func answerPressed(_ sender: AnyObject) {
    
        if sender.tag == 1 {
            pickedAnswer = true
        }
        
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber = questionNumber + 1
        
        updateUI()
        
    }
    
    // This method will update all the views on screen (progress bar, score label, etc)
    func updateUI() {
        
        progressBar?.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        
        progressLabel?.text = String(questionNumber) + "/13"
        
        scoreLabel?.text = "Score: " + String(self.score)
        
        nextQuestion()
    }
    
    

    //This method will update the question text and check if we reached the end.
    func nextQuestion() {
        
        if questionNumber <= 12 {
            
            questionLabel?.text = allQuestions.list[questionNumber].questionText
            
        }
            
        else {
            
            self.view.isUserInteractionEnabled = false
            
            reaction()
            
            let delayInSeconds = 5.0 // 1
            DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) { // 2
                
                self.view.isUserInteractionEnabled = true
                
                self.sendScoreToDB()
                
                
                let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over? ", preferredStyle: .alert)
                
                let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                    
                    self.startOver()
                    
                })
                
                let showScores = UIAlertAction(title: "View Scores", style: .default, handler:
                { UIAlertAction in
                    
                    self.performSegue(withIdentifier: "goToScores", sender: self)
                    
                })
                
                alert.addAction(showScores)
                
                alert.addAction(restartAction)
                
                self.present(alert, animated: true, completion: nil)
                
            }
            
            
            
        }
        
    }
    
    //This method will check if the user has got the right answer.
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {

            if  questionNumber <= 12 {
           ProgressHUD.showSuccess("Correct!")
                
            }
            
            self.score = self.score + 1
        }
            
        else {
            
            if questionNumber <= 12 {
         ProgressHUD.showError("Wrong!") }
        }
        
        print(yourScore)
    }
    
    //This method will wipe the board clean, so that users can retake the quiz.
    func startOver() {
       
        questionNumber = 0
        self.score = 0
        
        updateUI()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "goToScores") {
            
            let vc = segue.destination as! SecondViewController
            
            vc.score = self.yourScore
            
            vc.scoreKey = self.scoreKey
            
            
            
            //print(self.score)
            
        }
        
    }
    
    func sendScoreToDB(){
        
        
//        if(FirebaseApp.app() == nil){
//
//         FirebaseApp.configure()
//
//         }
//
//        let scoreDB = Database.database().reference(fromURL:"https://flash-chat-2bbf2.firebaseio.com/")
//
//        scoreDB.childByAutoId().setValue(score)
//
//        scoreDB.observeSingleEvent(of: .value, with: { snapshot in
//
//            if !snapshot.exists() { return }
//
//            let highScore = snapshot.value! as? Dictionary <String,Int>
//
//            let valuesArray = Array(highScore!.values)
//
//            let keysArray = Array(highScore!.keys)
//
//            self.yourScore = valuesArray.sorted().last!
//
//            self.scoreKey = keysArray.sorted().last!
//
//
//        })
        
        let a = String(score)
        
        let scoreDB = Database.database().reference().child("users").child(self.username).child("score")
        
        scoreDB.setValue(a)
        
        let delayInSeconds = 1.0 // 1
        DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) { // 2
            self.fetchData()
            
            
        } }
        
        
        
        
        
        
    
    
    
    func signUp() {
        
        let email = "steven@gmail.com"
        
        let password = "1234567"
        
//        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
//            if let error = error {
//
//
//            } else {
//
//
//                if let user = user {
//
//
//                    let dictionary = ["score":"50", "name": self.username] as [String : Any]
//
//
//                    Database.database().reference().child("users").child(self.uid).setValue(dictionary)
//
//
//                }
//            }
//        })
        
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                
                print(error) } else {
                print("Log In was successful :)")
                
                
            }
            
        })
        
        
        
        
        
    }
    
    func reaction() {
        
          self.firstImageView.alpha = 1
        
        view.addSubview(firstImageView)
        firstImageView.frame = view.frame
        
        switch score {
        case 0...6:
            let imageData = try! Data(contentsOf: Bundle.main.url(forResource: "smh", withExtension: "gif")!)
            
            self.firstImageView.animate(withGIFData: imageData)
            
            
        case 7...9:
            let imageData = try! Data(contentsOf: Bundle.main.url(forResource: "", withExtension: "gif")!)
            
            self.firstImageView.animate(withGIFData: imageData)
            
        case 10...13:
            
            let imageData = try! Data(contentsOf: Bundle.main.url(forResource: "good job", withExtension: "gif")!)
            
            self.firstImageView.animate(withGIFData: imageData)
        default:
            print("Keep Trying")
        }
        
       
       
        
        view.addSubview(firstImageView)
        firstImageView.frame = view.frame

//        UIView.animate(withDuration: 6, animations: {
//
//
//
//
//
//            self.firstImageView.alpha = 0
//
//
//        })
        
        let delayInSeconds = 5.0 // 1
        DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) { // 2
            
            self.firstImageView.alpha = 0
        }
        
        


    }
    
    
    
    
    
    
    
    func fetchData() {
        
        
        let rootRef = Database.database().reference()
        let query = rootRef.child("users").queryOrdered(byChild: "score")
        query.observeSingleEvent(of: .value) {
            (snapshot) in
            
            print(snapshot)
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let value = child.value as? NSDictionary
                let name = value?["name"] as? String ?? ""
                let score = value?["score"] as? String ?? ""
                
                //   print(name)
                //   print(score)
                if let a = Int(score)  {
                    self.interger.append(a)
                    //     print(self.interger)
                    
                }
                
                if let b = name as String? {
                    self.names.append(b)
                    //    print(self.names)
                    
                }
                
                assert(self.names.count == self.interger.count)
                var dict = [String:Int]()
                for i in 0..<self.interger.count {
                    let key = self.names[i]
                    let value = self.interger[i]
                    dict[key] = value
                }
                
                //   (Array(dict).sorted{$0.1 < $1.1}).forEach{(k,v) in print("\(k):\(v)")}
                
                
                
                dict = [String : Int](uniqueKeysWithValues: dict.sorted{ $1.value < $0.value })
                print(dict)
                
                
                            let valuesArray = Array(dict.values)
                
                            let keysArray = Array(dict.keys)
                
               print(keysArray)
              print(valuesArray)
                
                            self.yourScore = valuesArray
                
                            self.scoreKey = keysArray
                
            }
        
        }
    }
        
    
    
    
    
}   // End of the class

