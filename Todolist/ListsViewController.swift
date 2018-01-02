//
//  ListsViewController.swift
//  Todolist
//
//  Created by Mac on 2017/12/27.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit



class ListsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var logoutbtn: UIButton!
    
    var result = [String:Any]()
    var lists:NSArray = []
    var select: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutbtn.layer.cornerRadius = 5
        logoutbtn.clipsToBounds = true
        lists = result["list"] as! NSArray
        
        
        
        print(result)
        print(lists[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listcell")
        
        cell?.textLabel?.text = (lists[indexPath.row] as! NSDictionary).object(forKey: "title") as! String
        
        return cell!
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        select = indexPath.row
        performSegue(withIdentifier: "showdetail", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showdetail"{
            
            let nextVC = segue.destination as! detailViewController
            nextVC.result = result
            nextVC.select = select
            nextVC.lists = lists
        }
        
        
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
