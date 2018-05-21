//
//  ResultViewController.swift
//  QuizInterViewApp
//
//  Created by Sukumar Anup Sukumaran on 21/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    var modelResultData = [ModelFile]()
    
    @IBOutlet weak var resultTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension ResultViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelResultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as! ResultTableViewCell
        
        cell.questionLabel.text = modelResultData[indexPath.row].questions
        
        if globalClass.sharedInst.correctData[indexPath.row] == globalClass.sharedInst.selectedData[indexPath.row] {
             cell.selectedLabel.text = "Yes!! it is  -> \(globalClass.sharedInst.selectedData[indexPath.row])"
        }else {
             cell.selectedLabel.text = "Wrong, real ans is-> \(globalClass.sharedInst.correctData[indexPath.row]) "
        }
       
        
        return cell
    }
    
    
}
