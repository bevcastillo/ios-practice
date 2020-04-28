//
//  ViewController.swift
//  reminder-app
//
//  Created by Beverly May Castillo on 4/27/20.
//  Copyright © 2020 Beverly May Castillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        switch section {
//        case 0:
//            return "Daily Tasks"
//        case 1:
//            return "Weekly Tasks"
//        case 2:
//            return "Monthly Tasks"
//        default:
//            return nil
//        }
//    }
    
    //Table View Data Source Methods
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return dailyTask.count
//        case 1:
//            return weeklyTask.count
//        case 2:
//            return monthlyTask.count
//        default:
//            return 0
//        }
        
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell()
//
//        switch indexPath.section {
//        case 0:
//            cell.textLabel?.text = dailyTask[indexPath.row]
//        case 1:
//            cell.textLabel?.text = weeklyTask[indexPath.row]
//        case 2:
//            cell.textLabel?.text = monthlyTask[indexPath.row]
//        default:
//            cell.textLabel?.text = "Should hit this"
//        }
//
//        return cell
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        
        //set the contents
        myCell.textLabel?.text = "This is row number \(indexPath.row)"
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You have selected row \(indexPath.row) in \(indexPath.section)")
    }
    
    
    let dailyTask = ["Check all windows",
                     "Check all doors",
                     "Is the boiler fueled?",
                     "Check the mailbox",
                     "Empty trash containers",
                     "If freezing, check water pipes",
                     "Document \"strange and unusual\" occurences",]
    
    let weeklyTask = ["Check inside all cabins",
                      "Flush all lavatories in cabins",
                      "Walk the perimeter property",]
    
    let monthlyTask = ["Test security alarms",
                       "Test motion detectors",
                       "Test smoke alarms",]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

