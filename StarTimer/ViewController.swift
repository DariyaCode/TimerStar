//
//  ViewController.swift
//  StarTimer
//
//  Created by Dariya Gecher on 01.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    // MARK: - Table view Timer
    
    var time = 3 % 60
    var startTime = 3 % 60
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        labelData.text = person.labelTime
        labelName.text = person.name
        labelSurname.text = person.surname
        labelNickname.text = person.nick
        evilImageView.image = UIImage(named: person.evilImageName)
        labelEpisode.text = String(person.episode)
        labelGender.text = person.gender
        labelAge.text = String(person.age)
        labelPower.text = person.power
        labelHardest.text = String(person.hardest)
        details.text = person.describe
        
        if person.imageSecond == ""{
            imageView.image = UIImage(named: person.imageName)
        } else {
            imageView.image = UIImage(named: person.imageSecond)
        }
        
        startTime = time
        
        let tableView = TableViewController()
        
        if time == 0{
            tableView.addingPerson()
            timer.invalidate()
            //таймер запустится снова:
            time = startTime
            isTimerRunning = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC"{
            if let secondVC = segue.destination as? SecondViewController{
                secondVC.time = Int(textField.text!) ?? 0
            }
        }
    }
    
    @objc func countTimer(){
        time -= 1
        
        if time == 0 {
            
            timer.invalidate()
            //таймер запустится снова:
            time = startTime
            isTimerRunning = false
        }
    }
    
    
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSurname: UILabel!
    @IBOutlet weak var labelNickname: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var evilImageView: UIImageView!
    @IBOutlet weak var labelEpisode: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelPower: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelHardest: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var label: UILabel!
    
    var person = Person()
    

}

