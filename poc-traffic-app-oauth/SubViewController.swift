//
//  SubViewController.swift
//  poc-traffic-app-oauth
//
//  Created by 八木真彦 on 2019/07/14.
//  Copyright © 2019 八木真彦. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    
    @IBOutlet weak var accessToken: UILabel!
    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var id: UILabel!
    
    var token:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "https://api.github.com/user"
        
        SampleService().connectAPI(url: url, token: token) { (data) in
            self.accessToken.text = self.token
            self.id.text = data?.id?.description
            self.login.text = data?.login
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
