//
//  LineChartViewController.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 15/03/24.
//

import UIKit
import Charts

class LineChartViewController: UIViewController {
    var lineChartView = LineChartView()
       var months: [String] = []
       var StatusParameter: [Double] = []
    
    init() {
      super.init(nibName: "LineChartViewController", bundle: nil)
     
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      setNavigationBar(type: .backAndTitle(title: "Line Chart"))
    }
    
    override func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
      navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        setLineChartData()
    }
    private func configureView(){
        
        lineChartView.frame = CGRect(x: 0, y: 50, width: view.frame.width-220, height: 400)
        view.addSubview(lineChartView)
          
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        StatusParameter = [3, 7, 8, 10, 5, 10, 1, 3, 5, 10, 7, 7]
    }
    
     private func setLineChartData() {
         var dataEntries: [ChartDataEntry] = []
         
         // Create chart entries
         for i in 0..<months.count {
             let dataEntry = ChartDataEntry(x: Double(i), y: StatusParameter[i])
             dataEntries.append(dataEntry)
         }
         
         // Create dataset and assign chart entries
         let dataSet = LineChartDataSet(entries: dataEntries, label: "Value")
         dataSet.colors = [UIColor.red]
         dataSet.circleColors = [UIColor.black]
         
         // Create line chart data and assign dataset
         let data = LineChartData(dataSet: dataSet)
         
         // Assign data to chart view
         lineChartView.data = data
         
         // Customize chart appearance if needed
         lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
         lineChartView.xAxis.labelPosition = .bottom
     }

   

}
