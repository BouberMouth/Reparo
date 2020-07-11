//
//  Main.swift
//  Reparo
//
//  Created by Antoine on 07/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

class Main: ObservableObject {
    @Published var userInfos: UserInfos?
    @Published var username: String = ""
    
    func getUserInfos(uid: String) {
        DatabaseService.shared.getUserInfos(uid: uid) { (snap, err) in
            if err != nil {
                print("ERROR: \(err!)")
            } else {
                print(snap!.data())
                self.username = snap!.data()!["username"] as! String
            }
        }
    }
}
