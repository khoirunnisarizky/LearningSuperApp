//
//  TabBarViewController.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 14/09/22.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        //Create tab for Chart page
        let chartType = ["Bar", "Line", "Pie"]
        let chartTab = GenericTableViewController(items: chartType) { (cell: UITableViewCell, type) in
            cell.textLabel?.text = type
            cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        } selectHandler: { type in
            var navController = UINavigationController()
            if type == chartType[0] {
                let vc = BarViewController()
                vc.navigationController?.navigationItem.title = "Bar"
                navController = UINavigationController(rootViewController: vc)
            } else if type == chartType[1] {
                navController = UINavigationController(rootViewController: LineViewController())
            } else if type == chartType[2] {
                navController = UINavigationController(rootViewController: PieViewController())
            }
            self.present(navController, animated: true)
        }
        
        let chartTabItem = UITabBarItem(title: "Chart", image: UIImage(systemName: "chart.bar.doc.horizontal"), selectedImage: UIImage(systemName: "chart.bar.doc.horizontal.fill"))

        chartTab.tabBarItem = chartTabItem
        
        let chartNavigation = UINavigationController(rootViewController: chartTab)
        chartTab.navigationItem.title = "Chart"
        chartTab.navigationController?.navigationBar.prefersLargeTitles = true
        
        //Create tab for Generic List
        let dataItems = Mentors().generateData()
        
        let genericListTab = GenericTableViewController(items: dataItems) { (cell: UITableViewCell, mentor) in
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
            
            let navigationController = UINavigationController(rootViewController: detailVC)
            self.present(navigationController, animated: true)
            
        }
        
        let genericListItem = UITabBarItem(title: "Generic List", image: UIImage(systemName: "tablecells.badge.ellipsis"), selectedImage: UIImage(systemName: "tablecells.fill.badge.ellipsis"))
        
        let genericNavigation = UINavigationController(rootViewController: genericListTab)
        genericListTab.tabBarItem = genericListItem
        genericListTab.navigationItem.title = "Mentors List"
        genericListTab.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.viewControllers = [chartNavigation, genericNavigation]
        

    }
    
}
