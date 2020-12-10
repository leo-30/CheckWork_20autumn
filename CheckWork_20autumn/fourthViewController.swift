//
//  fourthViewController.swift
//  CheckWork_20autumn
//
//  Created by Mio Harada on 2020/12/10.
//

import UIKit

class fourthViewController: UIViewController {

    @IBOutlet var dateField: UITextField!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var contextTextView: UITextView!
    
    @IBOutlet var pageLabel: UILabel!
    
    var number: Int = 1

    let saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(number)
        print("date\(number)")
        
        updateLabel()
    }
    
    @IBAction func save() {
        // 日記の内容をUserDefaultsで保存する
        saveData.set(dateField.text, forKey: "date\(number)")
        saveData.set(titleField.text, forKey: "title\(number)")
        saveData.set(contextTextView.text, forKey: "context\(number)")
        
        // アラートの表示
        let alert: UIAlertController = UIAlertController(title: "SAVE", message: "日記を保存しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "OK", style: .default, handler: { action in
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
        
        if saveData.object(forKey: "date\(number)") != nil {
            dateField.text = saveData.object(forKey: "date\(number)") as? String
        } else {
            dateField.text = ""
        }
        
        if saveData.object(forKey: "title\(number)") != nil {
            titleField.text = saveData.object(forKey: "title\(number)") as? String
        } else {
            titleField.text = ""
        }
        if saveData.object(forKey: "context\(number)") != nil {
            contextTextView.text = saveData.object(forKey: "context\(number)") as? String
        } else {
            contextTextView.text = ""
        }
    }
}
