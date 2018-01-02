//
//  detailViewController.swift
//  Todolist
//
//  Created by Mac on 2017/12/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class detailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var result = [String:Any]()
    var lists:NSArray = []
    var select = Int()
    var notes:NSArray = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let list = lists[select] as! NSDictionary
        
        notes = list.object(forKey: "notes") as! NSArray
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notes")
        
        cell?.textLabel?.text = notes[indexPath.row] as! String
        
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! ListsViewController
        
        nextVC.lists = lists
        nextVC.result = result
        
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
