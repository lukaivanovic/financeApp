//
//  ContentView.swift
//  Finance
//
//  Created by Luka Ivanović on 05.02.2023..
//

import SwiftUI

struct AddSheet: View {
    @EnvironmentObject var data: Data
    
    let myText: String
    
    enum FocusField: Hashable {
      case field
    }

    @FocusState private var focusedField: FocusField?
    
    @State private var inputDone = false
    
    var body: some View {
            VStack{
//                Text(myText)
//                TextField("Your name", text: $data.account.username)
//                    .multilineTextAlignment(.center)
//                    .focused($focusedField, equals: .field)
//                    .onAppear {
//                        self.focusedField = .field
//                    }
//                    .onSubmit {
//                        inputDone = true;
//                    }
//
//                if (data.account.username != ""){
//
//                } else {
//                    Button(""){
//
//                    }
//                    .padding(.top)
//                }
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct AddSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddSheet(myText: "teslololt")
            .environmentObject(Data())
    }
}
