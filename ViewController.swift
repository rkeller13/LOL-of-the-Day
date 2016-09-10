//
//  ViewController.swift
//  Joke of the Day
//
//  Created by Robert Keller on 11/4/15.
//  Copyright © 2015 Robert Keller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var jokeLabel3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let url = NSURL(string: "http://tambal.azurewebsites.net/joke/random")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                let websiteArray = webContent?.componentsSeparatedByString(":")
                
                if websiteArray!.count > 0 {
                    
                    let jokeArray = websiteArray![1].componentsSeparatedByString("}")
                    
                    if jokeArray.count > 0 {
                            
                            let jokeOfTheDay = jokeArray[0].stringByReplacingOccurrencesOfString("<br>", withString: "\n\n")
                        
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            
                                self.jokeLabel3.text = jokeOfTheDay
                                
                        })
                        
                    }
                    
                        
                    
                    
                }
                
                
                
                
            }
            
        }
        
        task.resume()
        
        
        self.refreshDaily();
        var timer = NSTimer.scheduledTimerWithTimeInterval(1440.0, target: self, selector: "refreshDaily", userInfo: nil, repeats: true)
    }
    
    func refreshDaily() {
        
        let url = NSURL(string: "http://tambal.azurewebsites.net/joke/random")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                let websiteArray = webContent?.componentsSeparatedByString(":")
                
                if websiteArray!.count > 0 {
                    
                    let jokeArray = websiteArray![1].componentsSeparatedByString("}")
                    
                    if jokeArray.count > 0 {
                        
                        let jokeOfTheDay = jokeArray[0].stringByReplacingOccurrencesOfString("<br>", withString: "\n\n")
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            
                            self.jokeLabel3.text = jokeOfTheDay
                            
                        })
                        
                    }
                    
                    
                    
                    
                }
                
                
                
                
            }
            
        }
        
        task.resume()
        

    }
    
    

    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

