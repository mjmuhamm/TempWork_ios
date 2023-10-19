//
//  CompanyMeViewController.swift
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

class CompanyMeViewController: UIViewController {
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var workLocation: UILabel!
    @IBOutlet var addButton: MDCButton!
    
    
    @IBOutlet var profileButton: MDCButton!
    @IBOutlet var currentJobsButton: MDCButton!
    @IBOutlet var bankingButton: MDCButton!
    
    
    //Profile
    
    @IBOutlet var profileView: UIView!
    
    @IBOutlet var numberOfBids: UILabel!
    @IBOutlet var amountOfMoneySpent: UILabel!
    
    @IBOutlet var supervisor1: UIImageView!
    @IBOutlet var supervisor2: UIImageView!
    @IBOutlet var supervisor3: UIImageView!
    @IBOutlet var supervisor4: UIImageView!
    @IBOutlet var supervisor5: UIImageView!
    
    @IBOutlet var workConditions1: UIImageView!
    @IBOutlet var workConditions2: UIImageView!
    @IBOutlet var workConditions3: UIImageView!
    @IBOutlet var workConditions4: UIImageView!
    @IBOutlet var workConditions5: UIImageView!
    
    @IBOutlet var likelyReturn1: UIImageView!
    @IBOutlet var likelyReturn2: UIImageView!
    @IBOutlet var likelyReturn3: UIImageView!
    @IBOutlet var likelyReturn4: UIImageView!
    @IBOutlet var likelyReturn5: UIImageView!
    
    @IBOutlet var reviewButton: UIButton!
    
    //NextJob
    @IBOutlet var currentJobsView: UIView!
    
    @IBOutlet var nextJobLabel: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var companyName: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var workTime: UILabel!
    @IBOutlet var payRate: UILabel!
    
    @IBOutlet var clickToViewDetailButton: UIButton!
    @IBOutlet var cancelButton: MDCButton!
    @IBOutlet var viewDetailHiddenButton: UIButton!
    @IBOutlet var noJobYetLabel: UILabel!
    
    //Banking
    @IBOutlet var bankingView: UIView!
    
    @IBOutlet var accountStatusButton: UIButton!
    @IBOutlet var pendingPayoutLabel: UILabel!
    @IBOutlet var receivedPayoutsLabel: UILabel!
    @IBOutlet var viewTransactionHistoryButton: UIButton!
    @IBOutlet var accountNumberButton: UIButton!
    
    //Recent Jobs
    @IBOutlet var jobsTableView: UITableView!
    @IBOutlet var jobConstraint: NSLayoutConstraint!
    //221
    //3
    
    
    
    
    private var toggle = "profile"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobToggle(job: "no")
        
        profileView.isHidden = false
        currentJobsView.isHidden = true
        jobsTableView.isHidden = true
        bankingView.isHidden = true
        
        navigationItem.title = "United Parcel Service"
        
        
        cancelButton.applyOutlinedTheme(withScheme: secondGlobalContainerScheme())
        
        jobsTableView.register(UINib(nibName: "JobBoardTableViewCell", bundle: nil), forCellReuseIdentifier: "JobBoardTableViewReusableCell")
        jobsTableView.delegate = self
        jobsTableView.dataSource = self
    }
    
    private func jobToggle(job: String) {
        
        if job == "yes" {
            
            
            nextJobLabel.isHidden = false
            date.isHidden = false
            companyName.isHidden = false
            location.isHidden = false
            workTime.isHidden = false
            payRate.isHidden = false
            clickToViewDetailButton.isHidden = false
            viewDetailHiddenButton.isHidden = false
            cancelButton.isHidden = false
            noJobYetLabel.isHidden = true
            
        } else {
            
            nextJobLabel.isHidden = true
            date.isHidden = true
            companyName.isHidden = true
            location.isHidden = true
            workTime.isHidden = true
            payRate.isHidden = true
            clickToViewDetailButton.isHidden = true
            viewDetailHiddenButton.isHidden = true
            cancelButton.isHidden = true
            noJobYetLabel.isHidden = false
            
        }
    }
    
    @IBAction func profileButtonPressed(_ sender: Any) {
        
        toggle = "profile"
        profileView.isHidden = false
        currentJobsView.isHidden = true
        jobsTableView.isHidden = true
        bankingView.isHidden = true
        
        addButton.setImage(UIImage(systemName: "pencil.circle.fill"), for: .normal)
        
        
        profileButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        profileButton.setTitleColor(UIColor.white, for: .normal)
        currentJobsButton.setBackgroundColor(UIColor.white)
        currentJobsButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        bankingButton.setBackgroundColor(UIColor.white)
        bankingButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
    
        
    }
    
    @IBAction func currentJobButtonPressed(_ sender: Any) {
        
        toggle = "currentJobs"
        profileView.isHidden = true
        currentJobsView.isHidden = false
        jobsTableView.isHidden = false
        bankingView.isHidden = true
        
        jobConstraint.constant = 221
        
        addButton.setImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        
        jobToggle(job: "yes")
        
        profileButton.setBackgroundColor(UIColor.white)
        profileButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        currentJobsButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        currentJobsButton.setTitleColor(UIColor.white, for: .normal)
        bankingButton.setBackgroundColor(UIColor.white)
        bankingButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
    
        
    }
    
    @IBAction func bankingButtonPressed(_ sender: Any) {
        
        toggle = "banking"
        profileView.isHidden = true
        currentJobsView.isHidden = true
        jobsTableView.isHidden = true
        bankingView.isHidden = false
        addButton.setImage(UIImage(systemName: "pencil.circle.fill"), for: .normal)
        
        
        
        profileButton.setBackgroundColor(UIColor.white)
        profileButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        currentJobsButton.setBackgroundColor(UIColor.white)
        currentJobsButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        bankingButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        bankingButton.setTitleColor(UIColor.white, for: .normal)
    
        
    }
    
    @IBAction func recentJobButtonPressed(_ sender: Any) {
        
        toggle = "recent"
        profileView.isHidden = true
        currentJobsView.isHidden = true
        jobsTableView.isHidden = false
        bankingView.isHidden = true
        jobConstraint.constant = 3
        addButton.setImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        
        
        profileButton.setBackgroundColor(UIColor.white)
        profileButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        currentJobsButton.setBackgroundColor(UIColor.white)
        currentJobsButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        bankingButton.setBackgroundColor(UIColor.white)
        bankingButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        
    }
    
    @IBAction func viewDetailButtonPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "JobDetail") as! JobDetailViewController
        vc.origin = "currentJob"
        vc.userOrCompany = "company"
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func reviewButtonPressed(_ sender: Any) {
    }
    
    
}

extension CompanyMeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return recentJobs.count
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jobsTableView.dequeueReusableCell(withIdentifier: "JobBoardTableViewReusableCell", for: indexPath) as! JobBoardTableViewCell
    
        
        cell.detailButtonTapped = {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "JobDetail") as! JobDetailViewController
            vc.origin = "recentJob"
            vc.userOrCompany = "company"
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
