//
//  ViewController.swift
//  GraphDemo
//
//  Created by Ratnesh Swarkar on 3/6/19.
//  Copyright © 2019 Ratnesh Swarkar. All rights reserved.
//

import UIKit
import Charts
class ViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var barChartView: BarChartView!
    var months: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartView.delegate = self
        
        months = ["Jan", "Feb", "Mar"]
        barChartView.xAxis.valueFormatter = self
        
        let unitsSold = [20.0, 4.0, 6.0]
        setChart(values: unitsSold)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setChart(values: [Double]){
        barChartView.noDataText = "You need to provide data for the chart."
      
        var dataEntries: [BarChartDataEntry] = []
        let chartData = BarChartDataSet()
        for (i, val) in values.enumerated(){
            _ = chartData.addEntry(BarChartDataEntry(x: Double(i), y: val))
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        //barChartView.data = BarChartData(dataSet: chartData)
       
        
        let myBarChartData = BarChartData(dataSet: chartData)
        myBarChartData.barWidth = 0.4
       
        

        barChartView.xAxis.granularity = 1
       
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "test")
       // chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
       
        chartDataSet.colors = [UIColor(red: 51.0/255.0, green: 71.0/255.0, blue: 104.0/255.0, alpha: 1)]
       // chartDataSet.colors = ChartColorTemplates.colorful()
        myBarChartData.addDataSet(chartDataSet)
        barChartView.data = myBarChartData
        barChartView.chartDescription?.text = ""
        barChartView.xAxis.labelPosition = .bottom
        barChartView.legend.enabled = false
        //        barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        
        //        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        
        barChartView.leftAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.drawGridLinesEnabled = false
        barChartView.leftAxis.drawZeroLineEnabled = false
        
        barChartView.rightAxis.drawZeroLineEnabled=false
       
        let formatoNumeros: NumberFormatter = NumberFormatter()
        formatoNumeros.minimumFractionDigits = 0
        formatoNumeros.maximumFractionDigits = 2
        formatoNumeros.currencyGroupingSeparator = ","
        formatoNumeros.negativePrefix = " $"
        formatoNumeros.positivePrefix = " $"
       
       
        barChartView.leftAxis.valueFormatter = DefaultAxisValueFormatter.init(formatter: formatoNumeros)
       
        barChartView.rightAxis.enabled = false
        
       

    }

}

extension ViewController: IAxisValueFormatter{
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return months[ Int(value)]
    }
}



