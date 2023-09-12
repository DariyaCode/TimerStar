//
//  TableViewController.swift
//  StarTimer
//
//  Created by Dariya Gecher on 07.09.2023.
//

import UIKit

class TableViewController: UITableViewController {
    // MARK: - Table view data base
    
//    var arrayNames = ["Alya", "Adrien", "Luka", "Wang", "Chloé "]
//    var arraySurnames = ["Césaire", "Agreste", "Couffaine", "Fu", "Bourgeois"]
//    var arrayImage = ["alya", "adrien", "luka", "wang", "chloe"]

    var arrayPersons = [
        Person(name: "Alya", surname: "Césaire", nick: "Rena Rouge, Lady Wifi, Oblivio", imageName: "alya",imageSecond: "rouge", evilImageName: "wifi", episode: 1.1, gender: "F", age: 15, power: "proviennent", hardest: 2, describe: "Alya is rather energetic, passionate, funny, confident, adventurous, yet down to earth. Her foresight has come in handy many times such as posting her video of Ladybug on her blog first, before showing it to Marinette on her cellphone, mindful that something might go wrong knowing how clumsy her friend is."),
        Person(name: "Adrien", surname: "Agreste", nick: "Chat Noir, Chat Blanc", imageName: "adrien", imageSecond: "supercat", evilImageName: "catblank", episode: 1.1, gender: "M", age: 16, power: "destruction", hardest: 5, describe: "Lorsque Marinette commet une grave erreur, elle doit en assumer les conséquences et se battre contre quelqu'un qu'elle ne savait même pas qu'elle pouvait accumuler."),
        Person(name: "Luka", surname: "Couffaine", nick: "Viperion, Silencer, Truth", imageName: "luka", imageSecond: "viperion", evilImageName: "truth", episode: 3.3, gender: "M", age: 19, power: "tell him truth", hardest: 3, describe: "Luka is described as a calm and reserved boy who also has a mixed personality of being playful, charming, mature, and flirtatious. He is empathetic at reading people's emotions and usually expresses them through music. Luka seems to be an easygoing and relaxed boy. However, sometimes he can lose his calm if he feels that he and mainly his friends are being wronged."),
        Person(name: "Lila", surname: "Rossi", nick: "Super Liar, Miss Show-Off", imageName: "lila", evilImageName: "volpina", episode: 1.26, gender: "F", age: 16, power: "illusion", hardest: 3, describe: "Lila is a very crafty and sneaky liar. She can use her lies to manipulate people into doing what she wants. When this doesn't work, she tries to make others feel pity for her and manipulate them emotionally."),
        Person(name: "Chloé", surname: "Bourgeois", nick: "Queen Bee, AntiBug, Queen Wasp", imageName: "chloe", imageSecond: "queenbee", evilImageName: "queenwasp", episode: 1.1, gender: "F", age: 15, power: "immobilizing", hardest: 2, describe: "Chloé is a bossy, egotistical, and superficial girl who does everything in her power to crush and loves making her rivals' lives miserable. She thinks highly of herself and lowly of others believing that she deserves everything and takes pride in her luxurious lifestyle."),
        Person(name: "Aurore", surname: "Beauréal", nick: "Climatika", imageName: "aurora", evilImageName: "stormy", episode: 1.1, gender: "F", age: 16, power: "ctrl.weather.", hardest: 1, describe: "Normally, Aurore is charming and prideful. She is also a shy and soft person. Because of her arrogance, she is angry with Mireille for winning instead of her, but she keeps it to herself, only lamenting about it once she is alone. Over the series she's also been shown to be able to forgive people as she happily worked with Mireille as co-host for the Friendship Day event.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    // MARK: - Table view data source
    
    @objc func addingPerson(){
        
        arrayPersons.append(Person(name: "new name", surname: "new surname", imageName: "avatar"))
        arrayPersons.insert(Person(name: "new name", surname: "new surname", imageName: "avatar"), at: 0)
        
        tableView.reloadData()
        
    }
    
    
    @IBAction func addPerson(_ sender: Any) {
        arrayPersons.append(Person(name: "new name", surname: "new surname", imageName: "avatar"))
        
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPersons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let labelNames = cell.viewWithTag(1000) as! UILabel
        labelNames.text = arrayPersons[indexPath.row].name
        
        let labelSurnames = cell.viewWithTag(1001) as! UILabel
        labelSurnames.text = arrayPersons[indexPath.row].surname
        
        let mainImage = cell.viewWithTag(1002) as! UIImageView
        mainImage.image = UIImage(named: arrayPersons[indexPath.row].imageSecond)
        mainImage.image = UIImage(named: arrayPersons[indexPath.row].imageName)
        
        let imageView = cell.viewWithTag(1002) as! UIImageView
        imageView.image = mainImage.image

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailedViewController") as! ViewController
        
//        detailVC.name = arrayPersons[indexPath.row].name
//        detailVC.surname = arrayPersons[indexPath.row].surname
//        detailVC.imageName = arrayPersons[indexPath.row].imageName
        
        detailVC.person = arrayPersons[indexPath.row]
        
        navigationController?.show(detailVC, sender: self)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            arrayNames.remove(at: indexPath.row)
//            arraySurnames.remove(at: indexPath.row)
//            arrayImage.remove(at: indexPath.row)
            
            arrayPersons.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
