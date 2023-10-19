//
//  UserMeViewController.swift
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


class UserMeViewController: UIViewController {
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var jobPreference: UILabel!
    @IBOutlet var workLocation: UILabel!
    
    
    @IBOutlet var profileButton: MDCButton!
    @IBOutlet var nextJobButton: MDCButton!
    @IBOutlet var bankingButton: MDCButton!
    
    
    //NextJob
    @IBOutlet var nextJobView: UIView!
    
    @IBOutlet var nextJobLabel: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var companyName: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var workTime: UILabel!
    @IBOutlet var payRate: UILabel!
    
    @IBOutlet var seperator: UILabel!
    
    @IBOutlet var jobRequirementsLabel: UILabel!
    @IBOutlet var jobRequirements: UILabel!
    @IBOutlet var supervisorLabel: UILabel!
    @IBOutlet var supervisor: UILabel!
    @IBOutlet var supervisorPhoneLabel: UILabel!
    @IBOutlet var supervisorPhone: UILabel!
    @IBOutlet var supervisorNotesLabel: UILabel!
    @IBOutlet var supervisorNotes: UILabel!
    
    @IBOutlet var clickToViewDetailButton: UIButton!
    
    @IBOutlet var willBeThereButton: MDCButton!
    @IBOutlet var callOffButton: MDCButton!
    
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
    @IBOutlet var recentJobTableView: UITableView!
    
    private var recentJobs : [JobBoard] = []
    private var toggle = "profile"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextJobView.isHidden = false
        bankingView.isHidden = true
        recentJobTableView.isHidden = true
        jobToggle(job: "no")
        
        recentJobTableView.register(UINib(nibName: "JobBoardTableViewCell", bundle: nil), forCellReuseIdentifier: "JobBoardTableViewReusableCell")
        recentJobTableView.delegate = self
        recentJobTableView.dataSource = self
        
        willBeThereButton.applyOutlinedTheme(withScheme: globalContainerScheme())
        callOffButton.applyOutlinedTheme(withScheme: secondGlobalContainerScheme())

        // Do any additional setup after loading the view.
    }
    
    private func jobToggle(job: String) {
        if job == "yes" {
            
            nextJobLabel.isHidden = false
            date.isHidden = false
            companyName.isHidden = false
            location.isHidden = false
            workTime.isHidden = false
            payRate.isHidden = false
            seperator.isHidden = false
            jobRequirementsLabel.isHidden = false
            jobRequirements.isHidden = false
            supervisorLabel.isHidden = false
            supervisor.isHidden = false
            supervisorPhoneLabel.isHidden = false
            supervisorPhone.isHidden = false
            supervisorNotesLabel.isHidden = false
            supervisorNotes.isHidden = false
            clickToViewDetailButton.isHidden = false
            willBeThereButton.isHidden = false
            callOffButton.isHidden = false
            viewDetailHiddenButton.isHidden = false
            
            noJobYetLabel.isHidden = true
            
        } else {
            
            nextJobLabel.isHidden = true
            date.isHidden = true
            companyName.isHidden = true
            location.isHidden = true
            workTime.isHidden = true
            payRate.isHidden = true
            seperator.isHidden = true
            jobRequirementsLabel.isHidden = true
            jobRequirements.isHidden = true
            supervisorLabel.isHidden = true
            supervisor.isHidden = true
            supervisorPhoneLabel.isHidden = true
            supervisorPhone.isHidden = true
            supervisorNotesLabel.isHidden = true
            supervisorNotes.isHidden = true
            clickToViewDetailButton.isHidden = true
            willBeThereButton.isHidden = true
            callOffButton.isHidden = true
            viewDetailHiddenButton.isHidden = true
            
            noJobYetLabel.isHidden = false
            
        }
    }
    
    @IBAction func profileButtonPressed(_ sender: Any) {
        toggle = "profile"
        
        nextJobView.isHidden = false
        bankingView.isHidden = true
        recentJobTableView.isHidden = true
        
        jobToggle(job:  "no")
        
        profileButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        profileButton.setTitleColor(UIColor.white, for: .normal)
        nextJobButton.setBackgroundColor(UIColor.white)
        nextJobButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        bankingButton.setBackgroundColor(UIColor.white)
        bankingButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
    }
    
    
    @IBAction func nextJobButtonPressed(_ sender: Any) {
        toggle = "nextJob"
        
        nextJobView.isHidden = false
        bankingView.isHidden = true
        recentJobTableView.isHidden = true
        
        jobToggle(job:  "yes")
        
        profileButton.setBackgroundColor(UIColor.white)
        profileButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        nextJobButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        nextJobButton.setTitleColor(UIColor.white, for: .normal)
        bankingButton.setBackgroundColor(UIColor.white)
        bankingButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
    }
    
    @IBAction func bankingButtonPressed(_ sender: Any) {
        toggle = "banking"
        
        nextJobView.isHidden = true
        bankingView.isHidden = false
        recentJobTableView.isHidden = true
        
        profileButton.setBackgroundColor(UIColor.white)
        profileButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        nextJobButton.setBackgroundColor(UIColor.white)
        nextJobButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        bankingButton.setBackgroundColor(UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1))
        bankingButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    @IBAction func recentJobButtonPressed(_ sender: Any) {
        toggle = "recentJob"
        
        nextJobView.isHidden = true
        bankingView.isHidden = true
        recentJobTableView.isHidden = false
        
        profileButton.setBackgroundColor(UIColor.white)
        profileButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        nextJobButton.setBackgroundColor(UIColor.white)
        nextJobButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        bankingButton.setBackgroundColor(UIColor.white)
        bankingButton.setTitleColor(UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1), for: .normal)
        
    }
    
    @IBAction func viewDetailButtonPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "JobDetail") as! JobDetailViewController
        vc.origin = "me"
        vc.userOrCompany = "user"
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func willBeThereButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func callOffButtonPressed(_ sender: Any) {
        
    }
    

}

extension UserMeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return recentJobs.count
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recentJobTableView.dequeueReusableCell(withIdentifier: "JobBoardTableViewReusableCell", for: indexPath) as! JobBoardTableViewCell
    
        
        cell.detailButtonTapped = {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "JobDetail") as! JobDetailViewController
            vc.origin = "recentJob"
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

