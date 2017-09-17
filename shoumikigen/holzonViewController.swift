//
//  holzonViewController.swift
//  shoumikigen
//
//  Created by 柳澤宙輝 on 2017/05/28.
//  Copyright © 2017年 柳澤宙輝. All rights reserved.
//

import UIKit
import RealmSwift
import UserNotifications

class holzonViewController: UIViewController,UITextFieldDelegate {
    
    
    
    let realm = try! Realm()
    static var image : UIImage!
    var realmArray : [Relme]! = []
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var imageView: UIImageView!
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        imageView.image = holzonViewController.image
        realmArray  = Array(realm.objects(Relme))
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hozon(){
        
        
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
                    
                    //保存
                    let realmModelSample = Relme()
                    let resultModel = self.realm.objects(Relme.self).sorted(byKeyPath: "id", ascending: true).last
                    
                    if resultModel != nil   {
                        realmModelSample.id = (resultModel?.id)! + 1
                    }else{
                        realmModelSample.id = 0
                    }
                    
                    
                    
                    realmModelSample.name = self.nameTextField.text!
                    
                    realmModelSample.image = UIImageJPEGRepresentation(self.imageView.image!.resizeUIImage(width: 80, height: 80), 0.0)! as NSData
                    
                    realmModelSample.date = self.datePicker.date
                    
                    
                    // データを追加
                    try! self.realm.write() {
                        self.realm.add(realmModelSample)
                    }
                    
                    
                    
                    let content = UNMutableNotificationContent()
                    content.title = "賞味期限"
                    content.subtitle = "賞味期限が近づいている食品があります！" // 新登場！
                    content.body = "確認してください！"
                    content.sound = UNNotificationSound.default()
                    let calendar = Calendar.current
                    
                    let year = calendar.component(.year, from: self.datePicker.date)
                    let month = calendar.component(.month, from: self.datePicker.date)
                    let day = calendar.component(.day, from: self.datePicker.date)
                    let hour = calendar.component(.hour, from: self.datePicker.date)
                    let second = calendar.component(.second, from: self.datePicker.date)
                    let minute = calendar.component(.minute, from: self.datePicker.date)
                    
               
                    print(year)
                    print(month)
                    print(day)
                    print(hour)
                    print(minute)
                    print(second)
                    
                    
                    let component = DateComponents(calendar: Calendar.current, year: year, month: month, day: day, hour: hour,minute : minute, second: second)
                    let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: false)
                    
                
                    let request = UNNotificationRequest(identifier: "FiveSecond",
                                                        content: content,
                                                        trigger: trigger)
                    
                    // ローカル通知予約
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
                
            )
        )
        
        alert.addAction(
            UIAlertAction(
                title: "キャンセル",
                style:.cancel,
                handler: {action in
                    
                    NSLog("キャンセルボタンが押されました！")
                    
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

extension UIImage{
    
    // 画質を担保したままResizeするクラスメソッド.
    func resizeUIImage(width : CGFloat, height : CGFloat)-> UIImage!{
        
        let size = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        var context = UIGraphicsGetCurrentContext()
        
        self.draw(in: CGRect(x:0, y:0, width:size.width,height: size.height))
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
}
