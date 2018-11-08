//
//  pwdTableViewController.swift
//  InclassPassword
//
//  Created by Snigdha Bose on 11/2/18.
//  Copyright © 2018 Snigdha Bose. All rights reserved.
//

import UIKit

class pwdTableViewController: UITableViewController {
    
    var length:Int!
    var number:Int!
    var arr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .background).async {
            
            //array of passwords created
            var pwd:String!
            var i = 0
            
            while i <= self.number-1 {
                print(i)
                pwd=AppsData.getPassword(len: self.length)
                print("Pwd created #\(String(describing: i))! \(String(describing: pwd))!")
                
                self.arr.append(pwd)
                i = i + 1
            }
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        print("second controller Len Value  \(String(describing: length))");
        print("second controller number Value  \(String(describing: number))");
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }
    
    
    
    var pwdToPass:String!
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pwdCell", for: indexPath) as! pwdTableViewCell
        
        // Configure the cell...
        let cellData = arr[indexPath.row]
        cell.pwdLabel.text = cellData
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        // iterate: to get from selected cell
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as! pwdTableViewCell
        
        pwdToPass = currentCell.pwdLabel.text
        print("Pass  \(String(describing: pwdToPass))");
        
        performSegue(withIdentifier: "unwindSegue", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        print("Inside prepare 2")
        
        if (segue.identifier == "unwindSegue") {
            
            let viewController = segue.destination as? ViewController
            
            viewController?.pwdLabel.text = pwdToPass
            
            
        }
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
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

