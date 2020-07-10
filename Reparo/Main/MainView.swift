//
//  MainView.swift
//
//
//  Created by Antoine on 07/07/2020.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject var main = Main()
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink(destination: HistoryView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).fill(Color.blue)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(minHeight: 0, maxHeight: 100)
                        Text("Mes interventions")
                            .font(.system(size: 27, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 5).fill(Color.blue)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: 100)
                    Text("Mon profil")
                        .font(.system(size: 27, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                NavigationLink(destination: IssueCreationView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).fill(Color.red)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(minHeight: 0, maxHeight: 100)
                        Text("J'ai besoin d'une intervention !")
                            .font(.system(size: 27, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
            }.padding()
                .onAppear {
                self.main.getUserInfos(uid: self.session.session!.uid)
            }
            
            .navigationBarTitle(Text(main.username), displayMode: .inline)
        }
    }
}

