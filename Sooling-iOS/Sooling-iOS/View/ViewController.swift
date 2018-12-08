//
//  ViewController.swift
//  Sooling-iOS
//
//  Created by 여정승 on 08/12/2018.
//  Copyright © 2018 여정승. All rights reserved.
//

import UIKit
import KakaoOpenSDK
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("email :: \(user.profile.email)")
        print("name :: \(user.profile.imageURL(withDimension: 400))")
        
        print("user :: \(user.profile.familyName)")
        print("name :: \(user.profile.name)")
        print("given.name :: \(user.profile.givenName)")
        
    }
    

    private let signInButton = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    private let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    @IBAction func kakaoButton(_ sender: Any) {
        let session = KOSession.shared()
        
        if let s = session {
            if s.isOpen() {
                s.close()
            }
            
            s.open(completionHandler: { error in
                if error == nil {
                    print("no error")
                    
                    if s.isOpen() {
                        KOSessionTask.userMeTask(completion: { error, file in
                            print("errorL: \(error)")
                            print("file: \(file)")
                        })
                    } else {
                        print("실패")
                    }
                } else {
                    print("login error")
                }
            })
        }else {
            print("세션 에러")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
        
        
        signInButton.center = self.view.center
        image.center = self.view.center
        self.view.addSubview(signInButton)
        self.view.addSubview(image)
        
        
    }


}
