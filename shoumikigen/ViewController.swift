//
//  ViewController.swift
//  shoumikigen
//
//  Created by 柳澤宙輝 on 2017/04/24.
//  Copyright © 2017年 柳澤宙輝. All rights reserved.
//

import UIKit
import RealmSwift
import UserNotifications

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let realm = try! Realm()
    
    
    var imageView: UIImageView!
    var cameraImageView: UIImageView!
    @IBOutlet var shoumikigen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 10.0, *) {
            // iOS 10
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                if error != nil {
                    return
                }
                
                if granted {
                    debugPrint("通知許可")
                } else {
                    debugPrint("通知拒否")
                }
            })
            
        } else {
            // iOS 9
            let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
        }
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // フォアグラウンドで通知受信
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        //...
    }
    
    
    
    @IBAction func takephoto() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        }else{
            print("error")
        }
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickerMediaWithInfo info:[String : Any]) {
        cameraImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    
    }
        
    
    
    @IBAction func hozonzumi() {
 
    }
    
    
    @IBAction func sendphoto(){
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        
        
        self.present(imagePickerController, animated: true, completion: nil)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        
        
        self.dismiss(animated: true){
            holzonViewController.image = pickedImage
            self.performSegue(withIdentifier: "toNextView", sender: nil)
        }
    }
    
    
}



