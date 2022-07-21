//
//  PieViewController.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 21/07/22.
//

import UIKit
import Charts

class PieViewController: UIViewController, ChartViewDelegate {

    var pieChart = PieChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pieChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        pieChart.center = view.center
        view.addSubview(pieChart)
        
        var entries = [ChartDataEntry]()
        for x in 0 ..< 10 {
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.colorful()
        
        let data = PieChartData(dataSet: set)
        pieChart.data = data
        
    }

}
