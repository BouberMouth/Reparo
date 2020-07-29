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
