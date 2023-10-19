//
//  UserBidViewController.swift
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


class UserBidsViewController: UIViewController {

    @IBOutlet var pendingButton: MDCButton!
    @IBOutlet var scheduledButton: MDCButton!
    @IBOutlet var allBidsButton: MDCButton!
    
    @IBOutlet var bidTableView: UITableView!
    
    private var pendingJobs: [JobBoard] = []
    private var scheduledJobs: [JobBoard] = []
    private var allJobs : [JobBoard] = []
    
    private var toggle = "pending"
    
    @IBOutlet var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bidTableView.register(UINib(nibName: "JobBoardTableViewCell", bundle: nil), forCellReuseIdentifier: "JobBoardTableViewReusableCell")
        bidTableView.delegate = self
        bidTableView.dataSource = self
        
    }
    
    @IBAction func pendingButtonPressed(_ sender: Any) {
     
        toggle = "pending"
        
        infoLabel.text = "These are the jobs that are pending approval. Approved Jobs will appear in the 'Scheduled' Tab"
        
        pendingButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        pendingButton.setTitleColor(UIColor.white, for: .normal)
        scheduledButton.setBackgroundColor(UIColor.white)
        scheduledButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        allBidsButton.setBackgroundColor(UIColor.white)
        allBidsButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        
    }
    
    @IBAction func scheduledButtonPressed(_ sender: Any) {
        
        toggle = "scheduled"
        
        infoLabel.text = "These are the jobs that you have been approved for, and that are scheduled for your appearance. If you can not make it, please select the job, and tap 'Call Off'."
        
        pendingButton.setBackgroundColor(UIColor.white)
        pendingButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        scheduledButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        scheduledButton.setTitleColor(UIColor.white, for: .normal)
        allBidsButton.setBackgroundColor(UIColor.white)
        allBidsButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        
        
        
        
    }
    
    @IBAction func allBidsButtonPressed(_ sender: Any) {
        
        toggle = "all"
        
        infoLabel.text = "All the Bids you have completed will appear here."
        
        pendingButton.setBackgroundColor(UIColor.white)
        pendingButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        scheduledButton.setBackgroundColor(UIColor.white)
        scheduledButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        allBidsButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        allBidsButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    
}

extension UserBidsViewController: UITableViewDelegate, UITableViewDataSource {
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
        let cell = bidTableView.dequeueReusableCell(withIdentifier: "JobBoardTableViewReusableCell", for: indexPath) as! JobBoardTableViewCell
    
        
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
