//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Angela Yu on 26/08/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var list = [Question]()
    
    init() {
//        // Creating a quiz item and appending it to the list
//        let item = Question(text: "Valentine\'s day is banned in Saudi Arabia.", correctAnswer: true)
//
//        // Add the Question to the list of questions
//        list.append(item)
//
//        // skipping one step and just creating the quiz item inside the append function
//        list.append(Question(text: "A slug\'s blood is green.", correctAnswer: true))
//
//        list.append(Question(text: "Approximately one quarter of human bones are in the feet.", correctAnswer: true))
//
//        list.append(Question(text: "The total surface area of two human lungs is approximately 70 square metres.", correctAnswer: true))
//
//        list.append(Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", correctAnswer: true))
//
//        list.append(Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", correctAnswer: false))
//
//        list.append(Question(text: "It is illegal to pee in the Ocean in Portugal.", correctAnswer: true))
//
//        list.append(Question(text: "You can lead a cow down stairs but not up stairs.", correctAnswer: false))
//
//        list.append(Question(text: "Google was originally called \"Backrub\".", correctAnswer: true))
//
//        list.append(Question(text: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", correctAnswer: true))
//
//        list.append(Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAnswer: false))
//
//        list.append(Question(text: "No piece of square dry paper can be folded in half more than 7 times.", correctAnswer: false))
//
//        list.append(Question(text: "Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.", correctAnswer: true))
//    }
        // Creating a quiz item and appending it to the list
        let item = Question(text: "Soroya and Steven met during orientation at Temple University.", correctAnswer: true)
        
        // Add the Question to the list of questions
        list.append(item)
        
        // skipping one step and just creating the quiz item inside the append function
        list.append(Question(text: "Steven won 2 championships in a row in his professional fantasy football league.", correctAnswer: true))
        
        list.append(Question(text: "Steven took Soroya for modern jazz dance class for their first date.", correctAnswer: true))
        
        list.append(Question(text: "Soroya played organized basketball in her youth .", correctAnswer: true))
        
        list.append(Question(text: "Steven’s favorite meal for Soroya to cook is Chicken parm.", correctAnswer: true))
        
        list.append(Question(text: "Steven did basketball football and swimming in High School.", correctAnswer: false))
        
        list.append(Question(text: "Soroya and Steven use to foster puppies and kittens during college.", correctAnswer: true))
        
        list.append(Question(text: "Steven favorite cereal is Trix.", correctAnswer: false))
        
        list.append(Question(text: "Soroya’s first dog’s name was “Lady”", correctAnswer: false))
        
        list.append(Question(text: "Steven and Soroya both went to “Club Getaway” for summer camp trips in their youth.", correctAnswer: true))
        
        list.append(Question(text: "Soroya and Steven met the Obama’s daughters on a segway tour in DC", correctAnswer: false))
        
        list.append(Question(text: "Steven was president of Temple’s NSBE Chapter in college.", correctAnswer: false))
        
        list.append(Question(text: "Soroya and Steven’s dog is named after Bruce Lee in Enter The Dragon.", correctAnswer: false))
        
        
    }
        
    
}


