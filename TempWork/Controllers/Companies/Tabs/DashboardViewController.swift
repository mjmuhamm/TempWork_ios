//
//  DashboardViewController.swift
//  TempWork
//
//  Created by Malik Muhammad on 10/16/23.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_FilledTextAreasTheming
import MaterialComponents.MaterialTextControls_FilledTextFieldsTheming
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

import MaterialComponents.MaterialButtons
import MaterialComponents
import Charts


class DashboardViewController: UIViewController, ChartViewDelegate {

    @IBOutlet var weeklyButton: MDCButton!
    @IBOutlet var monthlyButton: MDCButton!
    @IBOutlet var quarterlyButton: MDCButton!
    @IBOutlet var totalButton: MDCButton!
    
    @IBOutlet var weeklyBarChart: BarChartView!
    @IBOutlet var monthlyBarChart: BarChartView!
    @IBOutlet var quarterlyBarChart: BarChartView!
    @IBOutlet var totalChart: PieChartView!
    
    private var toggle = "weekly"
    
    
    let date = Date()
    let df = DateFormatter()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
      
        let dateString = df.string(from: date)
        
        weeklyBarChart.delegate = self
        monthlyBarChart.delegate = self
        quarterlyBarChart.delegate = self
        totalChart.delegate = self
        
    }
    
    
    private func loadItemWeeklyData() {
        
        
    }
    
//    private func loadItemWeeklyData(itemTitle: String) {
//        if Auth.auth().currentUser != nil {
//            let month = "\(df.string(from: date))".prefix(7).suffix(2)
//            let year = "\(df.string(from: date))".prefix(4)
//            let yearMonth = "\(year), \(month)"
//            var itemId = ""
//            for i in 0..<items.count {
//                if items[i].itemTitle == itemTitle {
//                    itemId = items[i].menuItemId
//                }
//            }
//            //        var entries = [BarChartDataEntry]()
//            
//            var weeklyData : [BarChartDataEntry] = [BarChartDataEntry(x: 0, y: 0), BarChartDataEntry(x: 1, y: 0), BarChartDataEntry(x: 2, y: 0), BarChartDataEntry(x: 3, y: 0)]
//            let labels = ["Week 1", "Week 2", "Week 3", "Week 4"]
//            weeklyBarChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:labels)
//            if itemId != "" {
//                for i in 1..<5 {
//                    db.collection("Chef").document(Auth.auth().currentUser!.uid).collection("Dashboard").document("\(self.itemTypeText.text!)").collection(itemId).document("Month").collection(yearMonth).document("Week").collection("Week \(i)").getDocuments { documents, error in
//                        
//                        if error == nil {
//                            if documents != nil {
//                                for doc in documents!.documents {
//                                    let data = doc.data()
//                                    if let total = data["totalPay"]     {
//                                        //                                self.weeklyData[i-1] = "\(total)"
//                                        weeklyData[i-1] = BarChartDataEntry(x: Double(i), y: Double("\(total)")!)
//                                        
//                                        print("data \(doc.data())")
//                                        print("weekly data \(weeklyData[i-1])")
//                                        
//                                        self.weeklyBarChart.data?.notifyDataChanged()
//                                        print("2 \(i-1)")
//                                        
//                                        let set = BarChartDataSet(entries: weeklyData)
//                                        set.colors = ChartColorTemplates.pastel()
//                                        let data = BarChartData(dataSet: set)
//                                        self.weeklyBarChart.data = data
//                                        self.weeklyBarChart.xAxis.granularityEnabled = true
//                                        self.weeklyBarChart.xAxis.drawGridLinesEnabled = false
//                                        //            weeklyBarChart.xAxis.drawAxisLineEnabled = true
//                                        self.weeklyBarChart.leftAxis.drawAxisLineEnabled = false
//                                        self.weeklyBarChart.rightAxis.drawGridLinesEnabled = false
//                                        self.weeklyBarChart.xAxis.drawAxisLineEnabled = true
//                                        self.weeklyBarChart.leftAxis.drawAxisLineEnabled = true
//                                        self.weeklyBarChart.rightAxis.drawAxisLineEnabled = true
//                                        self.weeklyBarChart.leftAxis.drawGridLinesEnabled = false
//                                        self.weeklyBarChart.xAxis.axisMinimum = 0.2
//                                        self.weeklyBarChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
//                                        self.weeklyBarChart.xAxis.labelCount = labels.count
//                                        self.weeklyBarChart.xAxis.centerAxisLabelsEnabled = true
//                                        
//                                        let groupSpace = 0.1
//                                        let barSpace = 0.05
//                                        let barWidth = 0.25
//                                        
//                                        let gg = data.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
//                                        //                weeklyBarChart.xAxis.axisMaximum = Double(0) + gg * 6
//                                        self.weeklyBarChart.xAxis.axisMaximum = 4
//                                        data.groupBars(fromX:0, groupSpace: groupSpace, barSpace: barSpace)
//                                        self.weeklyBarChart.xAxis.labelCount = labels.count
//                                        self.weeklyBarChart.xAxis.centerAxisLabelsEnabled = true
//                                        data.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
//                                        
//                                        self.weeklyBarChart.xAxis.granularityEnabled = true
//                                        //            weeklyBarChart.xAxis.spaceMin = 0.3
//                                        self.weeklyBarChart.xAxis.labelWidth = 1
//                                        self.weeklyBarChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInOutQuart)
//                                    }}}
//                        }
//                    }}
//                
//                
//                //            entries.append(BarChartDataEntry(x: Double(total)!, y: i))
//                //            entries.append(BarChartDataEntry(x: Double(total)!, y: i))
//                //            entries.append(BarChartDataEntry(x: Double(total)!, y: i))
//                //            entries.append(BarChartDataEntry(x: Double(total)!, y: i))
//                
//                
//                
//                
//            }
//        }  else {
//            self.showToast(message: "Something went wrong. Please check your connection.", font: .systemFont(ofSize: 12))
//        }
//    }
    
//    private func loadItemMonthlyData(itemTitle: String) {
//        if Auth.auth().currentUser != nil {
//            var itemId = ""
//            let year = "\(df.string(from: date))".prefix(4)
//            var yearMonth = "\(year), \(month)"
//            
//            var monthlyData : [BarChartDataEntry] = [BarChartDataEntry(x: 0, y: 0), BarChartDataEntry(x: 1, y: 0), BarChartDataEntry(x: 2, y: 0), BarChartDataEntry(x: 3, y: 0), BarChartDataEntry(x: 4, y: 0), BarChartDataEntry(x: 5, y: 0)]
//            var labels = ["January", "February", "March", "April", "May", "June"]
//            
//            print("date \(year), \(month)")
//            if Int(month)! > 6 {
//                labels = ["July", "August", "September", "October", "November", "December"]
//            }
//            
//            var newMonth = monthStart
//            
//            for i in 0..<items.count {
//                if items[i].itemTitle == itemTitle {
//                    itemId = items[i].menuItemId
//                }
//            }
//            
//            for i in Int(monthStart)!-1..<Int(monthEnd)!-1 {
//                
//                print("month number statr \(newMonth)")
//                if i != 1 || i != 7 {
//                    newMonth = "\(i + 1)"
//                    if Int(newMonth)! < 10 {
//                        newMonth = "0\(newMonth)"
//                    }
//                }
//                yearMonth = "\(year), \(newMonth)"
//                print("yearmonth \(yearMonth)")
//                print("i \(i)")
//                db.collection("Chef").document(Auth.auth().currentUser!.uid).collection("Dashboard").document("\(self.itemTypeText.text!)").collection(itemId).document("Month").collection(yearMonth).document("Total").getDocument { document, error in
//                    
//                    if error == nil {
//                        if document != nil {
//                            if let total = document!.get("totalPay") {
//                                if self.monthStart == "01" {
//                                    monthlyData[i] = BarChartDataEntry(x: Double(i), y: Double("\(total)")!)
//                                } else {
//                                    monthlyData[i-6] = BarChartDataEntry(x: Double(i-6), y: Double("\(total)")!)
//                                }
//                                
//                                self.monthlyBarChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:labels)
//                                let set = BarChartDataSet(entries: monthlyData)
//                                set.colors = ChartColorTemplates.pastel()
//                                let data = BarChartData(dataSet: set)
//                                
//                                let groupSpace = 0.1
//                                let barSpace = 0.05
//                                let barWidth = 0.25
//                                
//                                let gg = data.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
//                                //            monthlyBarChart.xAxis.axisMaximum = Double(0) + gg * 6
//                                self.monthlyBarChart.xAxis.axisMaximum = 6
//                                self.monthlyBarChart.xAxis.axisMinimum = 0
//                                data.groupBars(fromX:0, groupSpace: groupSpace, barSpace: barSpace)
//                                data.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
//                                
//                                self.monthlyBarChart.xAxis.granularityEnabled = true
//                                self.monthlyBarChart.data = data
//                                self.monthlyBarChart.xAxis.drawGridLinesEnabled = false
//                                //        monthlyBarChart.xAxis.drawAxisLineEnabled = true
//                                self.monthlyBarChart.leftAxis.drawAxisLineEnabled = false
//                                self.monthlyBarChart.rightAxis.drawGridLinesEnabled = false
//                                self.monthlyBarChart.leftAxis.drawGridLinesEnabled = false
//                                self.monthlyBarChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
//                                //        monthlyBarChart.xAxis.axisMinimum = 4.0
//                                
//                                self.monthlyBarChart.leftAxis.drawAxisLineEnabled = true
//                                self.monthlyBarChart.rightAxis.drawAxisLineEnabled = true
//                                self.monthlyBarChart.leftAxis.drawGridLinesEnabled = false
//                                self.monthlyBarChart.xAxis.axisMinimum = 0.2
//                                self.monthlyBarChart.xAxis.labelCount = labels.count
//                                self.monthlyBarChart.xAxis.centerAxisLabelsEnabled = true
//                                
//                                //        monthlyBarChart.xAxis.spaceMin = 0.8
//                                self.monthlyBarChart.xAxis.labelWidth = 1
//                                self.monthlyBarChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInOutQuart)
//                                
//                            }
//                        }
//                    }
//                }
//            }
//        } else {
//            self.showToast(message: "Something went wrong. Please check your connection.", font: .systemFont(ofSize: 12))
//        }
//    }
    
//    private func loadItemYearlyData(itemTitle: String) {
//        if Auth.auth().currentUser != nil {
//            print("item data going")
//            var pieChartData : [PieChartDataEntry] = []
//            self.pieChart.clearValues()
//            self.pieChart.clear()
//            
//            
//            var array1 = ["Cater Items", "Executive Items", "MealKit Items"]
//            
//            var totalItems : [FoodItemsTotal] = []
//            if itemTypeText.text != "" {
//                if itemTypeText.text == "All" {
//                    for i in 0..<3 {
//                        db.collection("Chef").document(Auth.auth().currentUser!.uid).collection("Dashboard").document(array1[i]).getDocument { document, error in
//                            
//                            if error == nil {
//                                if document != nil {
//                                    if let total = document!.get("totalPay") {
//                                        pieChartData.append(PieChartDataEntry(value: Double(String(format: "%2.f", Double("\(total)")!))!, label: array1[i]))
//                                        
//                                        let set = PieChartDataSet(entries: pieChartData)
//                                        set.colors = ChartColorTemplates.pastel()
//                                        self.pieChart.entryLabelColor = .clear
//                                        set.entryLabelFont = .systemFont(ofSize: 11)
//                                        let data = PieChartData(dataSet: set)
//                                        self.pieChart.data = data
//                                        self.pieChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInOutQuart)
//                                    }
//                                }
//                            }
//                        }
//                    }
//                    
//                } else {
//                    
//                    db.collection("Chef").document(Auth.auth().currentUser!.uid).collection(self.itemTypeText.text!).getDocuments { documents, error in
//                        
//                        if error == nil {
//                            if documents?.documents != nil {
//                                for doc in documents!.documents {
//                                    let data = doc.data()
//                                    
//                                    if let menuItemId = data["randomVariable"] as? String, let itemTitle = data["itemTitle"] as? String {
//                                        
//                                        self.db.collection("Chef").document(Auth.auth().currentUser!.uid).collection("Dashboard").document(self.itemTypeText.text!).collection(menuItemId).document("Total").getDocument { document, error in
//                                            
//                                            if error == nil {
//                                                if document != nil {
//                                                    if let total = document?.get("totalPay") {
//                                                        print("total \(total)")
//                                                        print("item title \(itemTitle)")
//                                                        
//                                                        pieChartData.append(PieChartDataEntry(value: Double(String(format: "%2.f", Double("\(total)")!))!, label: itemTitle))
//                                                        self.pieChart.entryLabelColor = .clear
//                                                        
//                                                        let set = PieChartDataSet(entries: pieChartData)
//                                                        set.colors = ChartColorTemplates.pastel()
//                                                        set.entryLabelFont = .systemFont(ofSize: 11)
//                                                        let data = PieChartData(dataSet: set)
//                                                        self.pieChart.data = data
//                                                        self.pieChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInOutQuart)
//                                                        
//                                                    }
//                                                }
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
//                    
//                    
//                }
//            }
//        } else {
//            self.showToast(message: "Something went wrong. Please check your connection.", font: .systemFont(ofSize: 12))
//        }
//    }

    
    
    @IBAction func weeklyButtonPressed(_ sender: Any) {
        
        toggle = "weekly"
        
        weeklyBarChart.isHidden = false
        monthlyBarChart.isHidden = true
        quarterlyBarChart.isHidden = true
        totalChart.isHidden = true
        
        weeklyButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        weeklyButton.setTitleColor(UIColor.white, for: .normal)
        monthlyButton.setBackgroundColor(UIColor.white)
        monthlyButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        quarterlyButton.setBackgroundColor(UIColor.white)
        quarterlyButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        totalButton.setBackgroundColor(UIColor.white)
        totalButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        
    }
    
    @IBAction func monthlyButtonPressed(_ sender: Any) {
        
        toggle = "monthly"
        
        weeklyBarChart.isHidden = true
        monthlyBarChart.isHidden = false
        quarterlyBarChart.isHidden = true
        totalChart.isHidden = true
        
        weeklyButton.setBackgroundColor(UIColor.white)
        weeklyButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        monthlyButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        monthlyButton.setTitleColor(UIColor.white, for: .normal)
        quarterlyButton.setBackgroundColor(UIColor.white)
        quarterlyButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        totalButton.setBackgroundColor(UIColor.white)
        totalButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
    }
    
    @IBAction func quarterlyButtonPressed(_ sender: Any) {
        
        toggle = "quarterly"
        
        weeklyBarChart.isHidden = true
        monthlyBarChart.isHidden = true
        quarterlyBarChart.isHidden = false
        totalChart.isHidden = true
        
        weeklyButton.setBackgroundColor(UIColor.white)
        weeklyButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        quarterlyButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        quarterlyButton.setTitleColor(UIColor.white, for: .normal)
        monthlyButton.setBackgroundColor(UIColor.white)
        monthlyButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        totalButton.setBackgroundColor(UIColor.white)
        totalButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
    }
    
    @IBAction func totalButtonPressed(_ sender: Any) {
        
        toggle = "total"
        
        weeklyBarChart.isHidden = true
        monthlyBarChart.isHidden = true
        quarterlyBarChart.isHidden = true
        totalChart.isHidden = false
        
        weeklyButton.setBackgroundColor(UIColor.white)
        weeklyButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        monthlyButton.setBackgroundColor(UIColor.white)
        monthlyButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        quarterlyButton.setBackgroundColor(UIColor.white)
        quarterlyButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        totalButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        totalButton.setTitleColor(UIColor.white, for: .normal)
        
        
        
    }
    
}
