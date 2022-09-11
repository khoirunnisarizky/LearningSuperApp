//
//  ListViewController.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 31/08/22.
//

import UIKit

class ListViewController: UIViewController {
    
    var dataItems = Mentors().generateData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func seeMentors(_ sender: UIButton) {
        let mentorsVC = GenericTableViewController(items: dataItems) { (cell: UITableViewCell, mentor) in
            cell.textLabel?.text = mentor.name
            cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        } selectHandler: { mentor  in
            let detailVC = GenericTableViewController(items: [mentor]) { (cell: MentorTableViewCell, detailMentor) in
                if (cell.tag == 0) {
                    cell.textLabel?.text = detailMentor.name
                    cell.detailTextLabel?.text = detailMentor.role
                } else if (cell.tag == 1) {
                    cell.textLabel?.text = "Description"
                    cell.detailTextLabel?.text = detailMentor.description
                }
                cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
                cell.detailTextLabel?.font = UIFont.preferredFont(forTextStyle: .body)
                cell.detailTextLabel?.numberOfLines = 0
            } selectHandler: { error in
                print(error)
            }
            detailVC.navigationItem.title = "Detail"
            self.navigationController?.pushViewController(detailVC, animated: true)
            
        }
        mentorsVC.navigationItem.title = "Mentors List"
        self.navigationController?.pushViewController(mentorsVC, animated: true)
    }
    
}
