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
        
        // MARK: - Create tab for Chart page
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
        
        // MARK: - Create tab for Generic List
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
        
        // MARK: - Create tab for login page programmatically
        let loginTab = LoginViewController()
        let loginItem = UITabBarItem(title: "Login", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        let loginNavigation = UINavigationController(rootViewController: loginTab)
        loginTab.tabBarItem = loginItem
        loginTab.navigationItem.title = "Login"
        loginTab.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        // MARK: - Create tab for Dynamic On Boarding Page
        let dynamicOnBoardingTab = DynamicOnBoardingVC()
        let dynamicOnBoardingItem = UITabBarItem(title: "On Boarding", image: UIImage(systemName: "character.bubble"), selectedImage: UIImage(systemName: "character.bubble.fill"))
        let dynamicOnBoardingNavigation = UINavigationController(rootViewController: dynamicOnBoardingTab)
        dynamicOnBoardingTab.tabBarItem = dynamicOnBoardingItem
        dynamicOnBoardingTab.navigationItem.title = "On Boarding"
        dynamicOnBoardingTab.navigationController?.navigationBar.prefersLargeTitles = true
        
        // MARK: - Create tab for WebKit
        let webTab = WebViewController()
        let webItem = UITabBarItem(title: "Connect", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        let webNavigation = UINavigationController(rootViewController: webTab)
        webTab.tabBarItem = webItem
        webTab.navigationItem.title = "Connect to Web"
        webTab.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        self.viewControllers = [chartNavigation, genericNavigation, loginNavigation, dynamicOnBoardingNavigation, webNavigation]
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        for tabBarItem in (self.tabBar.items)!{
            let viewTabBar = tabBarItem.value(forKey: "view") as? UIView
            viewTabBar?.frame.origin.y  = -15
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 70
        tabBar.frame.origin.y = view.frame.height - 65
        tabBar.itemPositioning = .centered
    }
    
}
