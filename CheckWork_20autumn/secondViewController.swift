//
//  secondViewController.swift
//  CheckWork_20autumn
//
//  Created by Mio Harada on 2020/12/10.
//

import UIKit

class secondViewController: UIViewController {
    
    @IBOutlet var dateField: UITextField!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var contextTextView: UITextView!
    
    @IBOutlet var pageLabel: UILabel!
    
    var number: Int = 1
    
    // 教科書007のUserDefaultsを使ってみよう！
    let saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel()
    }
    
    // 教科書006のボタンによって表示内容を前後させる方法を使ってみよう！
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
    
    @IBAction func save() {
        // 日記の内容をUserDefaultsで保存する
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
    
    @objc func updateLabel() {
        pageLabel.text = "\(number)ページ目"
        
        if saveData.object(forKey: "context\(number)") != nil {
            contextTextView.text = saveData.object(forKey: "context\(number)") as? String
        } else {
            contextTextView.text = ""
        }
    }
}

