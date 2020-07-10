//
//  ContentView.swift
//  Reparo
//
//  Created by Antoine on 04/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI
import FirebaseDatabase

struct AuthenticationView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject var model: VModel = VModel()

    func getUser() {
        session.listen()
    }
    
    
    var body: some View {
        Group {
            if session.session != nil {
                MainView()                
            } else {
                SignInView()
            }
        }.onAppear(perform: getUser)
    }
}

class VModel: ObservableObject {
    @Published var userInfos: UserInfos?
    @Published var username: String = "username"
    
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
