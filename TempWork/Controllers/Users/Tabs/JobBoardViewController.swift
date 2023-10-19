//
//  UserHomeViewController.swift
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

class JobBoardViewController: UIViewController {
    

    @IBOutlet var tempButton: MDCButton!
    @IBOutlet var tempToHireButton: MDCButton!
    @IBOutlet var jobBoardTableView: UITableView!
    
    private var tempJobs: [JobBoard] = []
    private var tempToHireJobs: [JobBoard] = []
    
    private var toggle = "temp"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobBoardTableView.register(UINib(nibName: "JobBoardTableViewCell", bundle: nil), forCellReuseIdentifier: "JobBoardTableViewReusableCell")
        jobBoardTableView.delegate = self
        jobBoardTableView.dataSource = self

        
    }
    
    @IBAction func tempButtonPressed(_ sender: Any) {
        toggle = "temp"

        tempButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        tempButton.setTitleColor(UIColor.white, for: .normal)
        tempToHireButton.setBackgroundColor(UIColor.white)
        tempToHireButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        
    }
    
    
    @IBAction func tempToHireButtonPressed(_ sender: Any) {
        toggle = "tempToHire"
        
        tempButton.setBackgroundColor(UIColor.white)
        tempButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        tempToHireButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        tempToHireButton.setTitleColor(UIColor.white, for: .normal)
        
        
    }
    
}

extension JobBoardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if toggle == "temp" {
//            return tempJobs.count
            return 10
        } else {
            return tempToHireJobs.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jobBoardTableView.dequeueReusableCell(withIdentifier: "JobBoardTableViewReusableCell", for: indexPath) as! JobBoardTableViewCell
    
        
        cell.detailButtonTapped = {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "JobDetail") as! JobDetailViewController
            vc.origin = "jobBoard"
            vc.userOrCompany = "user"
            self.present(vc, animated: true, completion: nil)
        }
        
//        if toggle == "temp" {
//            let info = tempJobs[indexPath.row]
//            
//            cell.dateOfJob.text = info.dateOfJob
//            cell.companyName.text = info.companyName
//            cell.typeOfWork.text = info.typeOfWork
//            cell.location.text = info.location
//            cell.timeSlot.text = info.timeSlot
//            cell.amountPaid.text = info.amountPaid
//            
//            
//        } else {
//            let info = tempToHireJobs[indexPath.row]
//            
//            cell.dateOfJob.text = info.dateOfJob
//            cell.companyName.text = info.companyName
//            cell.typeOfWork.text = info.typeOfWork
//            cell.location.text = info.location
//            cell.timeSlot.text = info.timeSlot
//            cell.amountPaid.text = info.amountPaid
//        }
        
        
        return cell
    }
    
    
}
