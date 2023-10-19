//
//  ViewController.swift
//  TempWork
//
//  Created by Malik Muhammad on 10/15/23.
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


class StartController: UIViewController {
    
    @IBOutlet var usersButton: MDCButton!
    @IBOutlet var companiesButton: MDCButton!
    
    @IBOutlet var termsOfServiceText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        usersButton.applyOutlinedTheme(withScheme: globalContainerScheme())
        companiesButton.applyOutlinedTheme(withScheme: globalContainerScheme())
        
        
        
        
        var normalText = "Please review our "
        var boldText  = "Terms of Service"
        
        var secondNormalText = " and "
        var secondBoldText = "Privacy Policy"
        var thirdNormalText = " before continuing."
        
        var attributedString = NSMutableAttributedString(string:normalText)
        
        var attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13)]
        
        var boldString = NSMutableAttributedString(string: boldText, attributes:attrs)
        
        var secondAttributedString = NSMutableAttributedString(string:secondNormalText)
        
        var secondBoldString = NSMutableAttributedString(string: secondBoldText, attributes:attrs)
        
        var thirdAttributedString = NSMutableAttributedString(string:thirdNormalText)
        
        
        
        attributedString.append(boldString)
        attributedString.append(secondAttributedString)
        attributedString.append(secondBoldString)
        attributedString.append(thirdAttributedString)
        
        termsOfServiceText.attributedText = attributedString
        
        //        print("date \(Date().startOfWeek)")
        //        print("date \(Date().getWeekDates().thisWeek)")
        //        print("date \(Int(Date().timeIntervalSince1970))")
        //        df.dateFormat = "yyyy-MM-dd"
        //
        //        let x = df.date(from: "2023-01-05")
        //        print("datesss \(x!.getWeekDates().thisWeek)")
        //
        //        let dateString = df.string(from: date)
        //        let year = dateString.prefix(4)
        //        let month = dateString.prefix(7).suffix(2)
    }
    

    
    @IBAction func usersButtonPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserLogin") as! UserLoginViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    

    @IBAction func companiesButtonPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompanyLogin") as! CompanyLoginViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: 0, y: self.view.frame.size.height-180, width: (self.view.frame.width), height: 50))
        toastLabel.backgroundColor = UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 1;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

}
    
    

func globalContainerScheme() -> MDCContainerScheming {
  let containerScheme = MDCContainerScheme()
  // Customize containerScheme here...
    let colorScheme = MDCSemanticColorScheme(defaults: .material201804)
    colorScheme.primaryColor = UIColor(red: 98/255, green: 99/255, blue: 72/255, alpha: 1)
    colorScheme.secondaryColor = UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1)
    containerScheme.colorScheme = colorScheme
    
  return containerScheme
}

func secondGlobalContainerScheme() -> MDCContainerScheming {
  let containerScheme = MDCContainerScheme()
  // Customize containerScheme here...
    let colorScheme = MDCSemanticColorScheme(defaults: .material201804)
    colorScheme.primaryColor = UIColor.red
    colorScheme.secondaryColor = UIColor(red: 160/255, green: 162/255, blue: 104/255, alpha: 1)
    containerScheme.colorScheme = colorScheme
    
  return containerScheme
}



