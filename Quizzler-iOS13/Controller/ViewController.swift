//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by MoHaMeD on 4/13/20.
//  Copyright © 2020 MoHaMeD. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var ScoreLabel: UILabel!
    var player: AVAudioPlayer!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let flag = quizBrain.checkAnswer(userAnswer)
        
        if flag {
            sender.backgroundColor = UIColor.green
            
            let url = Bundle.main.url(forResource: "correct", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        } else {
            sender.backgroundColor = UIColor.red
            
            let url = Bundle.main.url(forResource: "wrong", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI() {
        let answers = quizBrain.getAnswers()
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        ScoreLabel.text = "Score: \(quizBrain.getScore())"
        
        firstButton.setTitle("\(answers[0])", for: .normal)
        secondButton.setTitle("\(answers[1])", for: .normal)
        thirdButton.setTitle("\(answers[2])", for: .normal)
        
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        firstButton.backgroundColor = UIColor.clear
        
    }
}

