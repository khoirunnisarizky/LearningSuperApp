//
//  GenericTableViewController.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 29/08/22.
//

import UIKit

class GenericTableViewController: UITableViewController {
    
    var mentors = Mentors()
    var mentorsData = [Mentors]()
    var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        mentorsData = mentors.generateData()
        
        // Register custom cell
        let firstTableViewCell = UINib(nibName: "FirstTableViewCell",
                                      bundle: nil)
        self.tableView.register(firstTableViewCell, forCellReuseIdentifier: "firstTableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mentorsData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstTableViewCell") as! FirstTableViewCell

        // Configure the cell...
        cell.nameLabel.text = mentorsData[indexPath.row].name
        return cell
    }
    
    // MARK: - Navigation
    // Override to navigate view controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "moveToDetail", sender: nil)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destinationVC = segue.destination as? DetailGenericTableViewController
        destinationVC?.mentorData = mentorsData[selectedIndex]
    }
    

}
