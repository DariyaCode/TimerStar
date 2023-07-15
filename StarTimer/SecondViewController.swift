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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = String(time)
    }
    
    @IBAction func startTimer(_ sender: Any) {
        
    }
    @IBAction func pauseTimer(_ sender: Any) {
        
    }
    @IBAction func restartTimer(_ sender: Any) {
        
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
