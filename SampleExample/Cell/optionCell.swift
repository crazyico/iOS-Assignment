//
//  optionCell.swift
//  SampleExample
//
//  Created by JAY on 10/08/23.
//

import UIKit

class optionCell: UITableViewCell {
    
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var imgVIew: UIImageView!
    @IBOutlet weak var btnNext: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpUI()
    }
    
    func setUpUI() {
        viewMain.backgroundColor = UIColor(red: 0, green: 172, blue: 232, alpha: 1)
        viewMain.layer.cornerRadius = 15
        imgVIew.image = UIImage(named: "logo")
        imgVIew.contentMode = .scaleAspectFit
        imgVIew.layer.cornerRadius = 15
        btnNext.titleLabel?.text = "NEXT"
        btnNext.layer.cornerRadius = 25
    }

    @IBAction func btnNextPressed(_ sender: Any) {
    }
}
