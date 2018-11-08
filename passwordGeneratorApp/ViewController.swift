//
//  ViewController.swift
//  InclassPassword
//
//  Created by Snigdha Bose on 11/2/18.
//  Copyright © 2018 Snigdha Bose. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var pwdLabel: UILabel!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    var temp = ["Weak(Length 5)", "Medium(Length 8)", "Strong(Length 15)", "Extra Strong(Length 25)" ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate=self
        tableView.dataSource=self
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return temp.count
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        // Configure the cell...
        let cellData = temp[indexPath.row]
        
        cell.cellLabel.text = cellData
        
        return cell
        
        
        
    }
    
    var value:String!
    //var pwd:String!
    var len:Int!
    var numPwd:Int!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("You selected cell #\(indexPath.row)!")
        
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as! TableViewCell
        
        value = currentCell.cellLabel?.text
        
        print("You selected cell #\(String(describing: value))!")
        print("index path #\(String(describing: temp[indexPath.row]))!")
        
        if indexPath.row == 0 {
            len = 5
            
        } else if indexPath.row == 1 {
            len = 8
        }
        else if indexPath.row == 2 {
            len = 15
        }
        else if indexPath.row == 3  {
            len = 25
        }
        print("Len Value  \(String(describing: len))");
        print("number Value  \(String(describing: number.text))");
        
        numPwd = Int(number.text!)
        
        
    }
    
    
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
    
    
    @IBAction func click(_ sender: Any) {
        
        if(inputValidation()){
            print("Inside click")
            performSegue(withIdentifier: "segue", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        print("Inside prepare")
        
        if (segue.identifier == "segue") {
            
            let viewController = segue.destination as? pwdTableViewController
            
            viewController?.length = len
            viewController?.number = numPwd
            
        }
    }
    
    
    func inputValidation() -> Bool {
        
        guard let number = number.text , !number.isEmpty else {
            let alert = UIAlertController(title: "Alert", message: "Please enter number to Passwords!!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        
        guard let selection = value, !selection.isEmpty
            else {
                let alert = UIAlertController(title: "Alert", message: "Please select password strength!!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
        }
        let regex: String = "(^[0]{1}$|^[-]?[1-9]{1}\\d*$)";
        if(!matchExists(for: regex, in: number)){
            let alert = UIAlertController(title: "Alert", message: "Invalid Number input - Please enter a number", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        
        return true
    }
    
    func matchExists(for regex: String, in text: String) -> Bool {
        return matches(for: regex, in: text).count > 0
    }
    func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            let finalResult = results.map {
                String(text[Range($0.range, in: text)!])
            }
            return finalResult
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
}




