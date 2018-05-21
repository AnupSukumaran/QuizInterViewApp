//
//  ViewController.swift
//  QuizInterViewApp
//
//  Created by Sukumar Anup Sukumaran on 21/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var option1Label: UILabel!
    @IBOutlet weak var option2Label: UILabel!
    @IBOutlet weak var option3Label: UILabel!
    
    @IBOutlet weak var option1Button: UIButton!
    
    @IBOutlet weak var option2Button: UIButton!
    
    @IBOutlet weak var option3Button: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    var modeData = [ModelFile]()
    var selectedBucket = [String]()
    
    var Q = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonDataCatcher()
        nextButton.isEnabled = false
        
    }
    
    
    func jsonDataCatcher(){
        
       if let path = Bundle.main.path(forResource: "QizJson", ofType: "json")
       {
        
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? NSDictionary, let questions = jsonResult["Questions"] as? [Any] {
                
                //print("QQQ =\(questions)")
                extractJsonvalues(json: questions as AnyObject)
            }
            
        }catch{
           print("Error = \(error.localizedDescription)")
        }
        
        
        
       }
        
    }
    
    
    func extractJsonvalues(json: AnyObject) {
        
        print("Json = \(json)")
        
        let jsonArray = json as! NSArray
        
        print("JSOnCount = \(jsonArray.count)")
        if jsonArray.count != 0 {
            
            for i:Int in 0..<jsonArray.count {
            
                let jObject = jsonArray[i] as! NSDictionary
                let uModelData: ModelFile = ModelFile()
                
                uModelData.questions = (jObject["Q1"] as? String)!
                uModelData.option1 = (jObject["op1"] as? String)!
                uModelData.option2 = (jObject["op2"] as? String)!
                uModelData.option3 = (jObject["op3"] as? String)!
                uModelData.correct = (jObject["Correct"] as? String)!
                modeData.append(uModelData)
            
        }
        
      }
        
        QuestionLabel.text = modeData[Q].questions
        option1Label.text = modeData[Q].option1
        option2Label.text = modeData[Q].option2
        option3Label.text = modeData[Q].option3
    }
    
    @IBAction func option1Button(_ sender: UIButton) {
        
        
        sender.isSelected = !sender.isSelected
        
        option2Button.isSelected = false
        option3Button.isSelected = false
        
        selectedBucket.removeAll()
        selectedBucket.append(modeData[Q].option1)
//        globalClass.sharedInst.selectedData.append(modeData[Q].option1)
//         print("Selected Data = \(globalClass.sharedInst.selectedData)")
        
//        if !option2Button.isSelected || !option3Button.isSelected {
//            globalClass.sharedInst.selectedData.remove(at: Q)
//        }
        
        if option1Button.isSelected {
            nextButton.isEnabled = true
        }else{
            nextButton.isEnabled = false
        }
        
    }
    
    @IBAction func option2Button(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        option1Button.isSelected = false
        option3Button.isSelected = false
        
        selectedBucket.removeAll()
        selectedBucket.append(modeData[Q].option2)
        
////        globalClass.sharedInst.selectedData.append(modeData[Q].option2)
////         print("Selected Data = \(globalClass.sharedInst.selectedData)")
//
//        if !option1Button.isSelected || !option3Button.isSelected {
//            globalClass.sharedInst.selectedData.remove(at: Q)
//        }
        
        if option2Button.isSelected {
            nextButton.isEnabled = true
        }else{
            nextButton.isEnabled = false
        }
        
    }
    
    
    @IBAction func option3Button(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        option1Button.isSelected = false
        option2Button.isSelected = false
        selectedBucket.removeAll()
        selectedBucket.append(modeData[Q].option3)
        
//        globalClass.sharedInst.selectedData.append(modeData[Q].option3)
//         print("Selected Data = \(globalClass.sharedInst.selectedData)")
//
//        if !option1Button.isSelected || !option2Button.isSelected {
//            globalClass.sharedInst.selectedData.remove(at: Q)
//        }
        
        if option3Button.isSelected {
            nextButton.isEnabled = true
        }else{
            nextButton.isEnabled = false
        }
    }
    
    
    
    
    
    
    @IBAction func NextQuestion(_ sender: Any) {
        
        option1Button.isSelected = false
        option2Button.isSelected = false
        option3Button.isSelected = false
        
        globalClass.sharedInst.selectedData.append(contentsOf: selectedBucket)
        globalClass.sharedInst.correctData.append(modeData[Q].correct)
        
        print("Selected Data = \(globalClass.sharedInst.selectedData)")
        print("Correct Data = \(globalClass.sharedInst.correctData)")
        
        
        Q+=1
        
        if Q == modeData.count {
            callResultVC()
            
        }else{
            QuestionLabel.text = modeData[Q].questions
            option1Label.text = modeData[Q].option1
            option2Label.text = modeData[Q].option2
            option3Label.text = modeData[Q].option3
        }
        
        
        
        
    }
    
    func callResultVC() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        vc.modelResultData = modeData
        
        present(vc, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

