//
//  ViewController.swift
//  Project02
//
//  Created by yaoyt on 2017/3/2.
//  Copyright © 2017年 yrhy. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]();
    var score = 0;
    var correctAnswer = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"];
        button1.layer.borderWidth = 1;
        button1.layer.borderColor = UIColor.lightGray.cgColor;
        button2.layer.borderWidth = 1;
        button2.layer.borderColor = UIColor.lightGray.cgColor;
        button3.layer.borderWidth = 1;
        button3.layer.borderColor = UIColor.lightGray.cgColor;
        askQuestion(action: nil);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(button:UIButton) {
        print("hhhh");
        if button.tag == correctAnswer {
            score += 1;
            title = "Right";
        } else {
            score -= 1;
            title = "Wrong";
        }
        
        let alert = UIAlertController(title: title, message: "score is \(score)", preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: askQuestion));
        present(alert, animated: true);
        
    }
    
    func askQuestion(action:UIAlertAction!) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String];
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3);
        button1.setImage(UIImage(named:countries[0]), for: .normal);
        button2.setImage(UIImage(named:countries[1]), for: .normal);
        button3.setImage(UIImage(named:countries[2]), for: .normal);
        title = countries[correctAnswer].uppercased();
        

    }
    
}

