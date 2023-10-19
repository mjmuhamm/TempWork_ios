//
//  CompanyBidsViewController.swift
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

class CompanyBidsViewController: UIViewController {

    @IBOutlet var pendingBidsButton: MDCButton!
    @IBOutlet var scheduledBidsButton: MDCButton!
    @IBOutlet var allBidsButton: MDCButton!
    
    
    @IBOutlet var jobTableView: UITableView!
    @IBOutlet var infoLabel: UILabel!
    
    private var pendingJobs : [JobBoard] = []
    private var scheduledJobs : [JobBoard] = []
    private var allJobs : [JobBoard] = []
    
    
    private var toggle = "pending"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobTableView.register(UINib(nibName: "JobBoardTableViewCell", bundle: nil), forCellReuseIdentifier: "JobBoardTableViewReusableCell")
        jobTableView.delegate = self
        jobTableView.dataSource = self

        
    }
    
    @IBAction func pendingBidsButtonPressed(_ sender: Any) {
        
        toggle = "pending"
        
        infoLabel.text = "Jobs will appear hear when awaiting for workers to fill them. After workers have filled them, they will appear in the 'Scheduled' Tab"
        
        pendingBidsButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        pendingBidsButton.setTitleColor(UIColor.white, for: .normal)
        scheduledBidsButton.setBackgroundColor(UIColor.white)
        scheduledBidsButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        allBidsButton.setBackgroundColor(UIColor.white)
        allBidsButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        
    }
    
    
    @IBAction func scheduledBidsButtonPressed(_ sender: Any) {
        
        toggle = "scheduled"
        
        infoLabel.text = "Jobs will appear hear after workers haved filled them. Here you can remove a worker from a bid and take your chances with another worker bidding for this position."
        
        pendingBidsButton.setBackgroundColor(UIColor.white)
        pendingBidsButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        scheduledBidsButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        scheduledBidsButton.setTitleColor(UIColor.white, for: .normal)
        allBidsButton.setBackgroundColor(UIColor.white)
        allBidsButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        
    }
    
    @IBAction func allBidsButtonPressed(_ sender: Any) {
        
        toggle = "all"
        infoLabel.text = "All the Bids that have been completed successfully will show here."
        
        pendingBidsButton.setBackgroundColor(UIColor.white)
        pendingBidsButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        scheduledBidsButton.setBackgroundColor(UIColor.white)
        scheduledBidsButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        allBidsButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        allBidsButton.setTitleColor(UIColor.white, for: .normal)
        
    }
    

}

extension CompanyBidsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if toggle == "pending" {
//            return pendingJobs.count
            return 10
        } else if toggle == "scheduled" {
            return scheduledJobs.count
        } else {
            return allJobs.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jobTableView.dequeueReusableCell(withIdentifier: "JobBoardTableViewReusableCell", for: indexPath) as! JobBoardTableViewCell
    
        
        cell.detailButtonTapped = {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "JobDetail") as! JobDetailViewController
            if self.toggle == "pending" {
                vc.origin = "bidPending"
            } else if self.toggle == "scheduled" {
                vc.origin = "bidScheduled"
            } else {
                vc.origin = "bidAll"
            }
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
