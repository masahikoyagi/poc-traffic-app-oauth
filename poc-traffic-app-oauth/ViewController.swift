//
//  ViewController.swift
//  poc-traffic-app-oauth
//
//  Created by 八木真彦 on 2019/07/13.
//  Copyright © 2019 八木真彦. All rights reserved.
//

import UIKit
import OAuthSwift

class ViewController: UIViewController {

    var oauthswift: OAuth2Swift?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        login()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sub" {
            let subViewController = segue.destination as! SubViewController
            subViewController.token = sender as! String
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func login() {
        
        let oauthswift = OAuth2Swift (
            consumerKey: "f89fe16e50ae1c6ae754",
            consumerSecret: "833b9c2d157ea9e7f391d90e51c2b94cb252273a",
            authorizeUrl: "https://github.com/login/oauth/authorize",
            accessTokenUrl: "https://github.com/login/oauth/access_token",
            responseType : "code"
        )
        
        self.oauthswift = oauthswift
        oauthswift.allowMissingStateCheck = true
        oauthswift.authorizeURLHandler = OAuthSwiftOpenURLExternally.sharedInstance
        oauthswift.authorize(withCallbackURL: URL(string: "oauth-sample://oauth-callback"), scope: "user", state: generateState(withLength: 10), success: {(credential, _, _) in
                print(credential.oauthToken)
                self.performSegue(withIdentifier: "sub", sender: credential.oauthToken)
            }
        ) { (error) in
            print(error.description)
        }
    }
}

