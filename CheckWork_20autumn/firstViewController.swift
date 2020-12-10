//
//  ViewController.swift
//  CheckWork_20autumn
//
//  Created by Mio Harada on 2020/12/10.
//

import UIKit

class firstViewController: UIViewController {

    @IBOutlet var contextTextView: UITextView!
    
    // 教科書007のUserDefaultsを使ってみよう！
    let saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.object(forKey: "context") != nil {
            contextTextView.text = saveData.object(forKey: "context") as! String
        }
    }
    
    @IBAction func save() {
        // 日記の内容をUserDefaultsで保存する
        saveData.set(contextTextView.text, forKey: "context")
        
        // アラートの表示
        let alert: UIAlertController = UIAlertController(title: "SAVE", message: "日記を保存しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "OK", style: .default, handler: { action in
                print("OKボタンが押された")
            }
        ))
        present(alert, animated: true, completion: nil)
    }
}

