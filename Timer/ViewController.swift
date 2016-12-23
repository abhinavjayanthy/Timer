//
//  ViewController.swift
//  Timer
//
//  Created by Abhinav Jayanthy on 12/23/16.
//  Copyright © 2016 Abhinav Jayanthy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var counter: UILabel!
    @IBOutlet var minutesHand: UILabel!
    @IBOutlet var hoursHand: UILabel!
    
    @IBOutlet var playButton: UIBarButtonItem!
    
    @IBOutlet var pauseUIbutton: UIBarButtonItem!
    
    @IBOutlet var stopUIButton: UIBarButtonItem!
    
    var seconds = 0
    var minutes = 0
    var hours = 0
    
    
    
    var time = Timer()
    
    func result()
    {
        if (seconds < 59)
        {
        seconds += 1
        
        counter.text = String(seconds)
        }
        else
        {
            if (minutes < 59){
            minutes += 1
            seconds = 0
            minutesHand.text = String(minutes)
            counter.text = String(seconds)
            }
            else
            {
                hours += 1
                minutes = 0
                seconds = 0
                hoursHand.text = String(hours)
                minutesHand.text = String(minutes)
                counter.text = String(seconds)
                
            }
            
        }
}

    @IBAction func startButton(_ sender: UIBarButtonItem) {
        
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.result), userInfo: nil, repeats: true)
        
        playButton.isEnabled = false
        pauseUIbutton.isEnabled = true
        stopUIButton.isEnabled = true

    }
    
    @IBAction func pauseButton(_ sender: UIBarButtonItem) {
        
        time.invalidate()
        playButton.isEnabled = true
        stopUIButton.isEnabled = true
        pauseUIbutton.isEnabled = false
        
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        
        time.invalidate()
        seconds = 0
        minutes = 0
        hours = 0
        counter.text = String(seconds)
        hoursHand.text = String(hours)
        minutesHand.text = String(minutes)
        playButton.isEnabled = true
        pauseUIbutton.isEnabled = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hoursHand.text = String(hours)
        minutesHand.text = String(minutes)
        counter.text = String(seconds)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

