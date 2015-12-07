//
//  ViewController.swift
//  JSON Example
//
//  Created by Ivaylo Todorov on 30.11.15 г..
//  Copyright © 2015 г. Ivaylo Todorov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://ip-api.com/json")!
        
        webView.loadRequest(NSURLRequest(URL: url))
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
        
            // Will happen when task completes
            
            if let urlContent = data {
             
                // hire is JSON code
                
                do {
             
              let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
            
                    print(jsonResult["city"])
                    
                } catch {
                    
                }
                // to hire
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                    self.webView.loadHTMLString(String(webContent!), baseURL: nil)
                
                    
                })
            
            } else {
                // Show error message
            }
        }
        task.resume()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

