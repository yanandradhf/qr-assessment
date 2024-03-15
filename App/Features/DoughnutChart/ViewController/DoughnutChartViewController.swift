//
//  DoughnutChartViewController.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import UIKit
import Charts
class DoughnutChartViewController: UIViewController,ChartViewDelegate {
    private let navigator: DoughnutChartNavigator
    
    var donutChartView = PieChartView()
    var chartData: [ChartData] = []
    var transactionData: [(String, Int)] = []
    init(navigator: DoughnutChartNavigator) {
        self.navigator = navigator
      super.init(nibName: "DoughnutChartViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      setNavigationBar(type: .backAndTitle(title: "Doughnut Chart"))
    }
    
    override func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
      navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure chart view
        donutChartView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        donutChartView.delegate = self
        view.addSubview(donutChartView)
        loadChartData()
        setupDonutChart()
    }
    private func loadChartData() {
            // Check if the JSON file exists in the application bundle
            guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
                print("JSON file not found")
                return
            }
            
            // Attempt to load and decode JSON data
            do {
                let jsonData = try Data(contentsOf: url)
                let response = try JSONDecoder().decode([ChartData].self, from: jsonData)
                chartData = response
                print("Data loaded successfully: \(chartData)")
                
                // Call method to setup donut chart
                setupDonutChart()
            } catch {
                print("Failed to decode JSON data: \(error.localizedDescription)")
            }
        }
        
    private func setupDonutChart() {
            var dataEntries: [PieChartDataEntry] = []
            
            // Iterate through chart data to create chart entries
            for dataItem in chartData[0].data {
                if let percentage = Double(dataItem.percentage) {
                    let entry = PieChartDataEntry(value: percentage, label: dataItem.label)
                    dataEntries.append(entry)
                }
            }
            
            // Create dataset and assign chart entries
            let dataSet = PieChartDataSet(entries: dataEntries, label: "")
            dataSet.colors = ChartColorTemplates.material()
            
            // Create pie chart data and assign dataset
            let data = PieChartData(dataSet: dataSet)
            
            // Assign data to chart view
            donutChartView.data = data
            
            // Customize chart appearance if needed
           
            donutChartView.drawHoleEnabled = true
            donutChartView.holeColor = UIColor.clear
            donutChartView.drawEntryLabelsEnabled = false
            donutChartView.isUserInteractionEnabled = true
        }
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            // When the user taps on the chart, you can respond to the action here
            if let pieEntry = entry as? PieChartDataEntry {
                print("You tapped on \(pieEntry.label ?? "")")
                
                // Find the corresponding data for the tapped label
                for dataItem in chartData[0].data {
                    if dataItem.label == pieEntry.label {
                        for transaction in dataItem.data {
                            let dataDetail = (transaction.trx_date, transaction.nominal)
                                   transactionData.append(dataDetail)
                        }
                    }
                }
                navigator.navigateToDetailChart(from: self, title: pieEntry.label ?? "" , data: transactionData)
                self.transactionData = []
            }
        }


}
