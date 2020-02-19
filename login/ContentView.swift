//
//  ContentView.swift
//  login
//
//  Created by Kendall Motes on 2/17/20.
//  Copyright © 2020 Kendall Motes. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

    var authCont = AuthController()

  var body: some View {
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
                
                Network.shared.apollo.fetch(query: GetUserByIdQuery(id: "0ff43c60-7285-4ae7-a712-34bfd9e3680d")) {
                    result in
                    switch result {
                    case .success(let graphQLResult):
                      print("Success! Result: \(graphQLResult)")
                    case .failure(let error):
                      print("Failure! Error: \(error)")
                    }
                }
                
                print("Button end")
            }) {
               LoginButtonContent()
            }
        }
        .padding()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

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
