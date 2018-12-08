//
//  ViewController.swift
//  Sooling-iOS
//
//  Created by 여정승 on 08/12/2018.
//  Copyright © 2018 여정승. All rights reserved.
//

import UIKit
import KakaoOpenSDK

class ViewController: UIViewController {

//    let buttton = KOLoginButton.
    
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
    }


}

