//
//  TextInput.swift
//  Finance
//
//  Created by Luka Ivanović on 11.02.2023..
//

import SwiftUI

struct TextInput: View {
    var textLabel: String
    
    @Binding var textInput: String
    @Binding var pathAbove: NavigationPath
    
    @State private var currentInput = ""
    
    enum FocusField: Hashable {
      case field
    }

    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        TextField(textLabel, text: $currentInput)
            .multilineTextAlignment(.center)
            .navigationBarBackButtonHidden(true)
            .focused($focusedField, equals: .field)
            .onAppear {
                self.focusedField = .field
            }
            .onSubmit {
                textInput = currentInput
                pathAbove.append(120)
            }
    }
}

//struct TextInput_Previews: PreviewProvider {
//    static var previews: some View {
//        TextInput()
//    }
//}
