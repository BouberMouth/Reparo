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
            ZStack {
                VStack {
                    
                    NavigationLink(destination: HistoryView()) {
                        
                        Text("Mes interventions")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .background(Color.blue)
                            .cornerRadius(5)
                            .padding(.vertical, 5)
                        
                    }
                    
                    Text("Mon profil")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .background(Color.blue)
                        .cornerRadius(5)
                        .padding(.vertical, 5)
                        .onTapGesture {
                            print(self.session)
                            self.session.signOut()
                            print(self.session)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: IssueCreationView()) {
                        
                        HStack {
                            Image(systemName: "plus")
                                .padding(.trailing, 5)
                            Text("J'ai besoin d'une intervention !")
                        }.font(.system(size: 14, weight: .bold, design: .rounded))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(5)
                            .padding(.vertical, 5)
                    }
                }.padding()
                
                if main.username == nil {
                    Rectangle().fill(Color.black).opacity(0.5).edgesIgnoringSafeArea(.all)
                    ProgressView()
                }
            }
            .onAppear {
                self.main.getUserInfos(uid: self.session.session!.uid)
            }
                
            .navigationBarTitle(Text(main.username ?? ""), displayMode: .inline)
        }
    }
}


struct ProgressView: View {
    
    @State var rotation: Double = -90
    
    var body: some View {
        Circle()
            .trim(from: 0.2, to: 1)
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round))
            .frame(width: 50, height: 50)
            .rotationEffect(Angle(degrees: rotation))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
                    withAnimation() {
                        self.rotation += 20
                    }
                }
        }
    }
}
