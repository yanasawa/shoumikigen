//
//  hozonzumiViewController.swift
//  shoumikigen
//
//  Created by 柳澤宙輝 on 2017/06/25.
//  Copyright © 2017年 柳澤宙輝. All rights reserved.
//

import UIKit
import RealmSwift


class hozonzumiViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table:UITableView!
    let realm = try! Realm()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        let realm = try! Realm()
        let realmArray : Results<Relme> = realm.objects(Relme)
        
    
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        
        
        cell?.textLabel?.text =
        
        return cell!
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
