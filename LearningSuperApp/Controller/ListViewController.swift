//
//  ListViewController.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 31/08/22.
//

import UIKit

class ListViewController: UIViewController {
    
    var dataItems = Mentors().generateData()
    var selectedData : Mentors?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func seeMentors(_ sender: UIButton) {
        let mentorsVC = GenericTableViewController(items: dataItems) { (cell: UITableViewCell, mentor) in
            cell.textLabel?.text = mentor.name
        } selectHandler: { mentor  in
            print(mentor.name as Any)
            self.selectedData = mentor
            let detailVC = GenericTableViewController(items: [mentor]) { (cell: MentorTableViewCell, detailMentor) in
                cell.textLabel?.text = detailMentor.name
                cell.detailTextLabel?.text = detailMentor.role
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
