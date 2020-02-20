//
//  ContentView.swift
//  login
//
//  Created by Kendall Motes on 2/17/20.
//  Copyright © 2020 Kendall Motes. All rights reserved.
//


import SwiftUI
import UIKit
import CoreData

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var showView = false
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

  var body: some View {
    NavigationView {
        VStack {
            WelcomeText()
            TextField("Email", text: $email)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button(action: {print("Button tapped")
                
                Network.shared.apollo.perform(mutation: LoginMutation(email: self.email, password: self.password)) {
                     result in
                     switch result {
                     case .success(let graphQLResult):
                        print("Success! Result: \(String(describing: graphQLResult.data))")
                        UserManager.shared.currentAuthToken = graphQLResult.data?.login.jwt ?? "no token"
//                        print("jwt:")
//                        print(UserManager.shared.currentAuthToken)
                        if (graphQLResult.data?.login.jwt != nil) {
                            self.showView = true
                        }
                    

                        
                     case .failure(let error):
                       print("Failure! Error: \(error)")
                     }
                 }

                print("Button end")
            }) {
               LoginButtonContent()
            }
            NavigationLink(destination: CreateDealView(), isActive: self.$showView) {
                 EmptyView()
             }
        }
        .padding()
    }.navigationBarBackButtonHidden(true)
    }
}

//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif

struct WelcomeText: View {
    var body: some View {
        return Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 100, height: 30)
            .background(Color.blue)
            .cornerRadius(10.0)
    }
}
