
//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Sneha gindi on 08/11/16.
//  Copyright © 2016 Sneha gindi. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    //Mark: Properties
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Use the edit button item provided by the table view controller
        navigationItem.leftBarButtonItem = editButtonItem
        
        //Load the sample data
        loadSampleMeals()
        }
    
    func loadSampleMeals() {
        let photo1 = UIImage(named: "bestSalad")!
        let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 3)!
        
        let photo2 = UIImage(named: "bestSteak")!
        let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "bestPasta")!
        let meal3 = Meal(name: "Pasta with meatballs", photo: photo3, rating: 4)!
        
        meals += [meal1, meal2, meal3]
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
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Table view cells are reused and should be dequed using a reuse identifier
        let cellIdentifier = "MealTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MealTableViewCell
        
        //Fetches the appropriate meal for the data source layout
        let meal = meals[indexPath.row]

        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            
            if let selectedPath = tableView.indexPathForSelectedRow {
                //Update an existing meal
                meals[selectedPath.row] = meal
                tableView.reloadRows(at: [selectedPath], with: .none)
            }
            
            else {
            // Add a new meal.
            let newIndexPath = NSIndexPath(row: meals.count, section: 0)
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
            }
        }
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
            meals.remove(at: indexPath.row)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail"{
            let mealDetailViewController = segue.destination as! MealViewController
            //Get the cell that generated this segue
            if let selectedMealCell = sender as? MealTableViewCell {
                let indexPath = tableView.indexPath(for: selectedMealCell)!
                let selectedMeal = meals[indexPath.row]
                mealDetailViewController.meal = selectedMeal
                
            }
        }
        else if segue.identifier == "AddItem"{
            print("Adding new meal!")
        }
    }
    
    
}
