//
//  CreateDeal.swift
//  login
//
//  Created by Kendall Motes on 2/19/20.
//  Copyright © 2020 Kendall Motes. All rights reserved.
//

import Foundation
import SwiftUI

struct CreateDealView: View {
    
    
    
    @State var email: String = ""
    @State var password: String = ""
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)


  var body: some View {
    NavigationView {
            VStack {
              
            
                PostDealText()
            }
        .padding()
      }.navigationBarBackButtonHidden(true)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct PostDealText: View {
    var body: some View {
        return Text("Lets Share the Joy")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}
//
//struct LoginButtonContent : View {
//    var body: some View {
//        return Text("LOGIN")
//            .font(.headline)
//            .foregroundColor(.white)
//            .padding()
//            .frame(width: 100, height: 30)
//            .background(Color.blue)
//            .cornerRadius(10.0)
//    }
//}
