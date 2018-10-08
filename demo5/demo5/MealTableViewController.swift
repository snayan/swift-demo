//
//  MealTableViewController.swift
//  demo5
//
//  Created by yang.zhang on 2018/10/8.
//  Copyright © 2018年 yang.zhang. All rights reserved.
//

import UIKit
import os.log

class MealTableViewController: UITableViewController {
    
    // MARK: Propertier
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem;
        if let savedMeals = loadMeals() {
            meals += savedMeals;
        } else {
            loadSampleMeals();
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count;
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError("The dequeued cell is not an instance  of MealTableViewCell");
        }
        let meal = meals[indexPath.row];
        cell.nameLabel.text = meal.name;
        cell.photoImageView.image = meal.photo;
        cell.ratingControl.rating = meal.rating;
        
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            os_log("delete row", log: OSLog.default, type: .debug);
            meals.remove(at: indexPath.row);
            saveMeals();
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender);
        
        switch segue.identifier ?? "" {
        case "AddItem":
            os_log("Add a new meal.", log: OSLog.default, type: OSLogType.debug);
            
        case "ShowItem":
            guard let mealViewController = segue.destination as? MealViewController else {
                fatalError("Unexpected destination: \(segue.destination)");
            }
            guard let selectedCell = sender as? MealTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))");
            }
            guard let indexPath = tableView.indexPath(for: selectedCell) else {
                fatalError("The Selected cell is not being displayed by the table");
            }
            let selectedMeal = meals[indexPath.row];
            mealViewController.meal = selectedMeal;
            
        default:
            os_log("Unexpected Segue Indentifier", log: OSLog.default, type: .debug);
        }
    }
    
    
    // MARK: Actions
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                meals[selectedIndexPath.row] = meal;
                tableView.reloadRows(at: [selectedIndexPath], with: .automatic);
            } else {
                let newIndexPath = IndexPath(row: meals.count, section: 0);
                meals.append(meal);
                tableView.insertRows(at: [newIndexPath], with: .automatic);
            }
            saveMeals();
        }
    }
    
    // MARK: Private Methods
    
    private func loadSampleMeals() {
        
        guard let meal1 = Meal(name: "Caprese Salad", photo: #imageLiteral(resourceName: "meal1"), rating: 4) else {
            fatalError("Unable to instantiate meal1");
        }
        
        guard let meal2 = Meal(name: "Chicken and Potatoes", photo: #imageLiteral(resourceName: "meal2"), rating: 5) else {
            fatalError("Unale to instantiate meal2");
        }
        
        guard let meal3 = Meal(name: "Pasta with Meatballs", photo: #imageLiteral(resourceName: "meal3"), rating: 3) else {
            fatalError("Unable to instantiate meal3");
        }
        
        meals += [meal1, meal2, meal3];
    }
    
    private func saveMeals() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path);
        if isSuccessfulSave {
            os_log("Meals successfully saved", log: OSLog.default, type: .debug);
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error);
        }
    }
    
    private func loadMeals() -> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURL.path) as? [Meal];
    }
    
}
