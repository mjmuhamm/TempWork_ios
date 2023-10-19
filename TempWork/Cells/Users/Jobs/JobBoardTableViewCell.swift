//
//  JobBoardTableViewCell.swift
//  TempWork
//
//  Created by Malik Muhammad on 10/16/23.
//

import UIKit

class JobBoardTableViewCell: UITableViewCell {
    
    
    @IBOutlet var multipleDays: UILabel!
    @IBOutlet var dateOfJob: UILabel!
    @IBOutlet var companyName: UILabel!
    @IBOutlet var typeOfWork: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var timeSlot: UILabel!
    @IBOutlet var amountPaid: UILabel!
    
    var detailButtonTapped : (() -> ()) = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func detailButtonClicked(_ sender: Any) {
        detailButtonTapped()
    }
    
}
