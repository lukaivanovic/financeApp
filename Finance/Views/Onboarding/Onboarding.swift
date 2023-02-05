//
//  Onboarding.swift
//  Finance
//
//  Created by Luka Ivanović on 11.02.2023..
//

import SwiftUI

struct Onboarding: View {
    @EnvironmentObject private var data: Data
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack (path: $path){
            NavigationLink("Sign up", value: "aabc")
            
            .navigationDestination(for: String.self){ string in
                TextInput(textLabel: "Your name", textInput: $data.usernameS, pathAbove: $path)
            }
            .navigationDestination(for: Int.self){ int in
                NumberInput(textLabel: "Your bank balance", textInput: $data.balance, pathAbove: $path, isUser: $data.isUser)
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(path: NavigationPath())
            .environmentObject(Data())
    }
}
