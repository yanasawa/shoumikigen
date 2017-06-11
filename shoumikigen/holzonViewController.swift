//
//  holzonViewController.swift
//  shoumikigen
//
//  Created by 柳澤宙輝 on 2017/05/28.
//  Copyright © 2017年 柳澤宙輝. All rights reserved.
//

import UIKit

class holzonViewController: UIViewController {
    
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hozon(){
        
        let alert:UIAlertController = UIAlertController(title: "保存",message:"保存しました",
                                                        preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style:.default,
            handler: {action in
                
                print("OKボタンが押されました!")
        }
            )
        )
        present(alert, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
