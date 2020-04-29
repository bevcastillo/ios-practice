//
//  ViewController.swift
//  reminder-app
//
//  Created by Beverly May Castillo on 4/27/20.
//  Copyright © 2020 Beverly May Castillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBAction func resetList(_ sender: Any) {
        for i in 0..<self.dailyTask.count {
            self.dailyTask[i].completed = false
        }
        
        for i in 0..<self.weeklyTask.count {
            self.weeklyTask[i].completed = false
        }
        
        for i in 0..<self.monthlyTask.count {
            self.weeklyTask[i].completed = false
        }
        
        taskTableView.reloadData()
    }
    
    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        if mySwitch.isOn {
            view.backgroundColor = UIColor.darkGray
        }else {
            view.backgroundColor = UIColor.white
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return nil
        }
    }
    
    //Table View Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clear
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTask.count
        case 1:
            return weeklyTask.count
        case 2:
            return monthlyTask.count
        default:
            return 0
        }
        
//        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        var currentTask: Task!

        switch indexPath.section {
        case 0:
            currentTask = dailyTask[indexPath.row]
        case 1:
            currentTask = weeklyTask[indexPath.row]
        case 2:
            currentTask = monthlyTask[indexPath.row]
        default:
            break
        }
    
        cell.textLabel!.text = currentTask.name
        
        if currentTask.completed {
            cell.textLabel?.textColor = UIColor.lightGray
            cell.accessoryType = .checkmark
        } else {
            cell.textLabel?.textColor = UIColor.black
            cell.accessoryType = .none
        }

        
        //clear out the background
        cell.backgroundColor = UIColor.clear
        
        return cell
        
//        let myCell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
//
//        //set the contents
//        myCell.textLabel?.text = "This is row number \(indexPath.row)"
//        myCell.imageView?.image = UIImage(named: "clock")
//        myCell.accessoryType = .disclosureIndicator
//        myCell.detailTextLabel?.text = "This is some label text"
//
//        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You have selected row \(indexPath.row) in \(indexPath.section)")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let completeAction = UIContextualAction(style: .normal, title: "Complete") { (action: UIContextualAction, sourceView: UIView, actionPerformed: (Bool) -> Void) in
            
            switch indexPath.section {
            case 0:
                self.dailyTask[indexPath.row].completed = true
            case 1:
                self.weeklyTask[indexPath.row].completed = true
            case 2:
                self.weeklyTask[indexPath.row].completed = true
            default:
                break
            }
            
            tableView.reloadData()
            
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [completeAction])
    }
    
    
    var dailyTask = [
        Task(name: "Check all windows", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check all doors", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Is the boiler fueled?", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check the mailbox", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Empty trash containers", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "If freezing, check water pipes", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Document \"Strange and unsual\" occurences", type: .daily, completed: false, lastCompleted: nil),]
    
    var weeklyTask = [
        Task(name: "Check inside all cabins", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Flush all lavatories in cabins", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Walk the perimeter property", type: .daily, completed: false, lastCompleted: nil),]
    
    var monthlyTask = [
        Task(name: "Test security alarms", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Test motion detectors", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Test smoke alarms", type: .daily, completed: false, lastCompleted: nil),]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "All Reminders"
    }


}

