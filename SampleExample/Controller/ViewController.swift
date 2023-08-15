//
//  ViewController.swift
//  SampleExample
//
//  Created by JAY on 10/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblOptionView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblOptionView.delegate = self
        tblOptionView.dataSource = self
        registerCell()
        tblOptionView.rowHeight = UITableView.automaticDimension
        tblOptionView.showsVerticalScrollIndicator = false
    }


    func registerCell() {
        tblOptionView.register(UINib(nibName: "optionCell", bundle: nil), forCellReuseIdentifier: "optionCell")
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "optionCell") as! optionCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DownloadPageViewController") as! DownloadPageViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
}
