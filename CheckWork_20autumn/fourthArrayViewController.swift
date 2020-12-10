//
//  fourthArrayViewController.swift
//  CheckWork_20autumn
//
//  Created by Mio Harada on 2020/12/10.
//

import UIKit

class fourthArrayViewController: UIViewController {
    
    @IBOutlet var dateField: UITextField!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var contextTextView: UITextView!
    
    @IBOutlet var pageLabel: UILabel!
    
    var number: Int = 1
    
    var dataArray: [String] = []
    var date: String = ""
    var titleText: String = ""
    var context: String = ""
    
    let saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(number)
        print("diaryData\(number)")
        
        updateLabel()
    }
    
    @IBAction func save() {
        // 日記の内容をUserDefaultsで保存する
        date = dateField.text!
        titleText = titleField.text!
        context = contextTextView.text!
        
        dataArray = [date, titleText, context]
        saveData.set(dataArray, forKey: "diaryData\(number)")
        
        // アラートの表示
        let alert: UIAlertController = UIAlertController(title: "SAVE", message: "日記を保存しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "OK", style: .default, handler: { action in
                //                    print(self.dataArray)
                print("OKボタンが押された")
            }
        ))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func next() {
        number += 1
        print(number)
        updateLabel()
    }
    
    @IBAction func back() {
        if number > 1 {
            number -= 1
        }
        print(number)
        updateLabel()
    }
    
    @objc func updateLabel() {
        pageLabel.text = "\(number)ページ目"
        //        print("diaryData\(number)")
        //        print(saveData.array(forKey: "diaryData\(number)"))
        
        if saveData.array(forKey: "diaryData\(number)") != nil {
            dataArray = saveData.array(forKey: "diaryData\(number)") as! [String]
            print(dataArray)
            dateField.text = dataArray[0] as! String
            titleField.text = dataArray[1] as! String
            contextTextView.text = dataArray[2] as! String
        } else {
            dateField.text = ""
            titleField.text = ""
            contextTextView.text = ""
        }
    }
}
