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

class DashboardViewController: UIViewController {

    @IBOutlet var weeklyButton: MDCButton!
    @IBOutlet var monthlyButton: MDCButton!
    @IBOutlet var quarterlyButton: MDCButton!
    @IBOutlet var totalButton: MDCButton!
    
    private var toggle = "weekly"
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func weeklyButtonPressed(_ sender: Any) {
        
        toggle = "weekly"
        
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
