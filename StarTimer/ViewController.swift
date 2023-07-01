//
//  ViewController.swift
//  StarTimer
//
//  Created by Dariya Gecher on 01.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC"{
            if let secondVC = segue.destination as? SecondViewController{
                secondVC.time = Int(textField.text!) ?? 0
            }
        }
    }

}

