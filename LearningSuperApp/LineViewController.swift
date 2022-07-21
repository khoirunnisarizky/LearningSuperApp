//
//  LineViewController.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 21/07/22.
//

import UIKit
import Charts

class LineViewController: UIViewController, ChartViewDelegate {

    var lineChart = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lineChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lineChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        var entries = [ChartDataEntry]()
        
        for x in 0 ..< 10 {
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.liberty()
        let data = LineChartData(dataSet: set)
        lineChart.data = data
    }
    

}
