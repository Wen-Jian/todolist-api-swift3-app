//
//  ViewController.swift
//  Todolist
//
//  Created by Mac on 2017/12/27.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBOutlet weak var passwordtextfield: UITextField!
    @IBOutlet weak var emailtextfield: UITextField!
    var result = [String:Any]()
    
    @IBAction func loginaction(_ sender: UIButton) {
        
        var url = URL(string: "https://doitlatter.herokuapp.com/users.json")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let params = ["login":["account":emailtextfield.text, "password":passwordtextfield.text], "commit":"login"] as! [String:Any]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            do {
                
                self.result = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any]
                
                print("do task")
                
                let httpurlresponse = response as! HTTPURLResponse
                
                if httpurlresponse.statusCode == 200{
                    
                    DispatchQueue.main.async {
                        
                        self.performSegue(withIdentifier: "getLists", sender: nil)
                        
                        
                    }
                    
                }
                
            
                
            }catch{
                
                print("err")
            }
            
//            self.statuscode = respond.statusCode
            
            
        }
        
        task.resume()
    }
    
        
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! ListsViewController
        nextVC.result = result
        
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

