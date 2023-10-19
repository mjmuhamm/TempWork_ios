//
//  JobDetailViewController.swift
//  TempWork
//
//  Created by Malik Muhammad on 10/17/23.
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

class JobDetailViewController: UIViewController {

    @IBOutlet var companyName: UILabel!
    
    @IBOutlet var date1: UILabel!
    @IBOutlet var date2: UILabel!
    @IBOutlet var date3: UILabel!
    @IBOutlet var date4: UILabel!
    @IBOutlet var date5: UILabel!
    
    @IBOutlet var typeOfWorkConstraint: NSLayoutConstraint!
    // 5 - 128.33
    // 4 - 105.33
    // 3 - 82.33
    // 2 - 59.67
    // 1 - 39.67
    
    @IBOutlet var typeOfWork: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var time1: UILabel!
    @IBOutlet var time2: UILabel!
    @IBOutlet var time3: UILabel!
    @IBOutlet var time4: UILabel!
    @IBOutlet var time5: UILabel!
    
    @IBOutlet var takeHomePayLabel: UILabel!
    @IBOutlet var takeHomePayAmount: UILabel!
    @IBOutlet var secondTotalPayLabel: UILabel!
    @IBOutlet var secondTotalPay: UILabel!
    @IBOutlet var takeHomePayConstraint: NSLayoutConstraint!
    @IBOutlet var secondTotalPayConstraint: NSLayoutConstraint!
    
    // 5 - 128.33
    // 4 - 105.33
    // 3 - 82.33
    // 2 - 59.67
    // 1 - 39.67
    
    
    @IBOutlet var jobRequirementView: UIView!
    
    @IBOutlet var jobRequirements: UILabel!
    @IBOutlet var leniencyLabel: UILabel!
    @IBOutlet var onSiteSupervisor: UILabel!
    @IBOutlet var contact: UILabel!
    @IBOutlet var supervisorNotes: UILabel!
    
    @IBOutlet var supervisor1Image: UIImageView!
    @IBOutlet var supervisor2Image: UIImageView!
    @IBOutlet var supervisor3Image: UIImageView!
    @IBOutlet var supervisor4Image: UIImageView!
    @IBOutlet var supervisor5Image: UIImageView!
    
    @IBOutlet var workConditions1Image: UIImageView!
    @IBOutlet var workConditions2Image: UIImageView!
    @IBOutlet var workConditions3Image: UIImageView!
    @IBOutlet var workConditions4Image: UIImageView!
    @IBOutlet var workConditions5Image: UIImageView!
    
    @IBOutlet var likelyReturn1Image: UIImageView!
    @IBOutlet var likelyReturn2Image: UIImageView!
    @IBOutlet var likelyReturn3Image: UIImageView!
    @IBOutlet var likelyReturn4Image: UIImageView!
    @IBOutlet var likelyReturn5Image: UIImageView!
    
    @IBOutlet var callOffButton: MDCButton!
    @IBOutlet var jobReviewButton: MDCButton!
    
    var origin = ""
    
    var userOrCompany = ""
    
    //Worker
    @IBOutlet var workerView: UIView!
    @IBOutlet var worker1Image: UIImageView!
    @IBOutlet var worker1Text: UILabel!
    @IBOutlet var worker2Image: UIImageView!
    @IBOutlet var worker2Text: UILabel!
    @IBOutlet var worker3Image: UIImageView!
    @IBOutlet var worker3Text: UILabel!
    @IBOutlet var worker4Image: UIImageView!
    @IBOutlet var worker4Text: UILabel!
    @IBOutlet var worker5Image: UIImageView!
    @IBOutlet var worker5Text: UILabel!
    
    @IBOutlet var secondCallOffButton: MDCButton!
    
    @IBOutlet var workerViewHeight: NSLayoutConstraint!
    //5 - 285
    //4 - 235
    //3 - 179
    //2 - 128
    //1 - 68
    
    
    
    @IBOutlet var viewHeightConstraint: NSLayoutConstraint!
    //910
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondCallOffButton.setTitle("Call Off", for: .normal)
        secondCallOffButton.applyOutlinedTheme(withScheme: secondGlobalContainerScheme())
        secondCallOffButton.isUppercaseTitle = false

        if origin == "jobBoard" {
            callOffButton.setTitle("Bid", for: .normal)
            callOffButton.applyOutlinedTheme(withScheme: globalContainerScheme())
        } else if origin == "recentJob" {
            callOffButton.setTitle("Review Job", for: .normal)
            callOffButton.applyOutlinedTheme(withScheme: secondGlobalContainerScheme())
        } else if origin == "bidPending" {
            callOffButton.setTitle("Remove Bid", for: .normal)
            callOffButton.applyOutlinedTheme(withScheme: secondGlobalContainerScheme())
        } else {
            callOffButton.setTitle("Call Off", for: .normal)
            callOffButton.applyOutlinedTheme(withScheme: secondGlobalContainerScheme())
        }
        callOffButton.isUppercaseTitle = false
        
        
        if userOrCompany == "user" {
            setupForUser()
        } else {
            setupForCompany()
        }
        
    }
    

    private func setupForUser() {
        
        workerView.isHidden = true
        jobRequirementView.isHidden = false
        callOffButton.isHidden = false
        secondCallOffButton.isHidden = true
        
        typeOfWorkConstraint.constant = 39.67
        takeHomePayConstraint.constant = 39.67
        
        supervisor1Image.image = UIImage(systemName: "star.fill")
        supervisor2Image.image = UIImage(systemName: "star.fill")
        supervisor3Image.image = UIImage(systemName: "star.fill")
        supervisor4Image.image = UIImage(systemName: "star.fill")
        
        workConditions1Image.image = UIImage(systemName: "star.fill")
        workConditions1Image.image = UIImage(systemName: "star.fill")
        workConditions1Image.image = UIImage(systemName: "star.fill")
        
        likelyReturn1Image.image = UIImage(systemName: "star.fill")
        likelyReturn2Image.image = UIImage(systemName: "star.fill")
        
        takeHomePayLabel.text = "Take Home Pay"
        
        secondTotalPay.isHidden = true
        secondTotalPayLabel.isHidden = true
//        viewHeightConstraint.constant = 900
//        viewHeightConstraint.constant = 793
        
        
    }
    
    private func setupForCompany() {
        
        workerView.isHidden = false
        jobRequirementView.isHidden = true
        callOffButton.isHidden = true
        secondCallOffButton.isHidden = false
        viewHeightConstraint.constant = 793
        
        typeOfWorkConstraint.constant = 39.67
        takeHomePayConstraint.constant = 39.67
        secondTotalPayConstraint.constant = 39.67
        
        secondTotalPay.isHidden = false
        secondTotalPayLabel.isHidden = false
        
        secondTotalPay.isHidden = false
        secondTotalPayLabel.isHidden = false
        takeHomePayLabel.text = "Pay Per Worker"
        
        
        worker2Image.isHidden = false
        worker2Text.isHidden = false
        worker3Image.isHidden = false
        worker3Text.isHidden = false
        worker4Image.isHidden = false
        worker4Text.isHidden = false
        worker5Image.isHidden = false
        worker5Text.isHidden = false
        
        workerViewHeight.constant = 285
        //5 - 285
        //4 - 235
        //3 - 179
        //2 - 128
        //1 - 68
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func jobReviewButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func callOffButtonPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func secondCallOffButton(_ sender: Any) {
    }
    

}
