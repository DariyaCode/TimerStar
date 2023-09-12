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
    
    var secondTime = 3 % 60
    //переменная отвечающая за то, что мы задаем секунды, с какой частотой будут создаваться новые ячейки в тейбл вью
    
    var startTime = 0
    
    var timer = Timer()
    
    var isTimerRunning = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = String(format: "%0.2d", secondTime)
        
        startTime = time
    }
    
    @objc func countTimer(){
        time -= 1
        
        label.text = String(format: "%0.2d", secondTime)
        
        if time == 0 {
            
            timer.invalidate()
            //таймер запустится снова:
            time = startTime
            isTimerRunning = false
            label.text = timeToString(intTime: time)
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
        timer.invalidate()
        time = startTime
        isTimerRunning = false
        label.text = timeToString(intTime: time)
    }
    
    func timeToString(intTime: Int) -> String{
        let seconds = intTime % 60
        let minutes = (intTime / 60) % 60
        let hours = intTime / 3600
        
        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
        
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
