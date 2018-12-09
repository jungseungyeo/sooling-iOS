//
//  UserModel.swift
//  Sooling-iOS
//
//  Created by 여정승 on 08/12/2018.
//  Copyright © 2018 여정승. All rights reserved.
//

import ObjectMapper

class UserInfo: Mappable {
    
    var name: String?
    var profileURL: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        self.name           <- map["name"]
        self.profileURL     <- map["profileURL"]
    }
}
