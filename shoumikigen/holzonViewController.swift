//
//  holzonViewController.swift
//  shoumikigen
//
//  Created by 柳澤宙輝 on 2017/05/28.
//  Copyright © 2017年 柳澤宙輝. All rights reserved.
//

import UIKit
import RealmSwift

class holzonViewController: UIViewController,UITextFieldDelegate {
    
    
    
    let realm = try! Realm()
    static var image : UIImage!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var imageView: UIImageView!
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        imageView.image = holzonViewController.image
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hozon(){
        
        let realmModelSample = Relme()
        
        
        let resultModel = realm.objects(Relme.self).sorted(byKeyPath: "id", ascending: true).last
        
        if resultModel != nil   {
            realmModelSample.id = (resultModel?.id)! + 1
        }else{
            realmModelSample.id = 0
        }
        
        
        
        realmModelSample.name = nameTextField.text!
        
        realmModelSample.image = UIImageJPEGRepresentation(imageView.image!, 0.0)! as NSData
        
        realmModelSample.date = datePicker.date
        
        
        // データを追加
        try! realm.write() {
            realm.add(realmModelSample)
        }
        
        let realmModelArray = realm.objects(Relme)
        
        
        // ためしに名前を表示
        for realmModel in realmModelArray {
            print("id: \(realmModel.id)")
            print("name: \(realmModel.name)")
            print(": \(realmModel.date)")
        }
        
        let alert:UIAlertController = UIAlertController(title: "保存", message: "保存してもいいですか？", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style:.default,
                handler: {action in
                    
                    NSLog("OKボタンが押されました！")
                    
            }
                
            )
        )
        
        alert.addAction(
            UIAlertAction(
                title: "キャンセル",
                style:.cancel,
                handler: {action in
                    
                    NSLog("OKボタンが押されました！")
                    
            }
                
            )
        )
        
        present(alert, animated: true, completion: nil)

        
        
        
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
