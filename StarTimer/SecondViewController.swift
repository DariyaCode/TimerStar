//
//  SecondViewController.swift
//  StarTimer
//
//  Created by Dariya Gecher on 01.07.2023.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var time = 0
    
    var startTime = 0
    
    var timer = Timer()
    
    var isTimerRunning = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = String(time)
        
        startTime = time
    }
    
    @objc func countTimer(){
        time -= 1
        
        label.text = String(time)
        
        if time == 0 {
            
            timer.invalidate()
            //isTimerRunning = false
        }
    }
    
    
    @IBAction func startTimer(_ sender: Any) {
        
        if isTimerRunning{
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTimer), userInfo: nil, repeats: true)
        
        isTimerRunning = true
    }
    
    
    @IBAction func pauseTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
    }
    
    @IBAction func restartTimer(_ sender: Any) {
        time = startTime
        isTimerRunning = false
        label.text = String(time)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
