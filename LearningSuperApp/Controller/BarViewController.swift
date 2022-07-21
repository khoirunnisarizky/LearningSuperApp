//
//  ViewController.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 21/07/22.
//

import UIKit
import Charts

class BarViewController: UIViewController, ChartViewDelegate {
    
    var barChart = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        barChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        barChart.center = view.center
        view.addSubview(barChart)
        
        var entries: [BarChartDataEntry] = []
        for x in 0 ..< 10 {
            entries.append(BarChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
        
        let data = BarChartData(dataSet: set)
        barChart.data = data
        
    }
    
    
}

