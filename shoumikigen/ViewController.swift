//
//  ViewController.swift
//  shoumikigen
//
//  Created by 柳澤宙輝 on 2017/04/24.
//  Copyright © 2017年 柳澤宙輝. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imageView: UIImageView!
    
    @IBOutlet var shoumikigen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func takephoto() {
        
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
            self.performSegue(withIdentifier: "toNextView", sender: nil)
        }
    }
    
    
}



